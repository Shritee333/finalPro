import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({Key? key}) : super(key: key);

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  File? _imageFile;
  final TextEditingController _grpNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _actNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      } else {
        Fluttertoast.showToast(
            msg: 'No image selected.', gravity: ToastGravity.CENTER);
      }
    });
  }

  Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('images/$fileName');
      await firebaseStorageRef.putFile(imageFile);
      String imageUrl = await firebaseStorageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  Future<void> storeImageAndDescriptionInFirestore(
      String imageUrl,
      String description,
      String grpName,
      String actName,
      String address,
      String date) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Store user information along with the image URL and description
        await FirebaseFirestore.instance.collection('images').add({
          'userId': user.uid, // User ID
          'grpName': grpName, // Use
          'actName': actName, // r name
          'userEmail': user.email ?? '', // User email
          'imageUrl': imageUrl,
          'description': description,
          'address': address,
          'date': date,
        });
        Fluttertoast.showToast(
            msg: 'Image and description stored successfully  ');
      } else {
        Fluttertoast.showToast(msg: 'No user signed in.');
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error storing image and description in Firestore: $e');
    }
  }

  Future<void> _submitForm() async {
    if (_imageFile == null) {
      Fluttertoast.showToast(msg: 'No image selected.');
      return;
    }

    String? imageUrl = await uploadImageToFirebaseStorage(_imageFile!);
    if (imageUrl != null) {
      String grpName =
          _grpNameController.text; // Get the user's name from the TextField
      String actName = _actNameController.text;
      String description =
          _descriptionController.text; // Get the description from the TextField
      String address = _addressController.text;
      String date = _dateController.text;
      await storeImageAndDescriptionInFirestore(
          imageUrl, description, grpName, actName, address, date);

      // Clear form fields and reset state
      _grpNameController.clear();
      _actNameController.clear();
      _descriptionController.clear();
      _addressController.clear();
      _dateController.clear();
      setState(() {
        _imageFile = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'उपक्रम',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: const BoxDecoration(),
                          child: const Center(
                            child: Text(
                              'गटांतर्गत राबवलेले उपक्रम',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
              child: Container(
                child: TextField(
                  cursorColor: const Color.fromARGB(115, 98, 96, 96),
                  controller: _grpNameController,
                  decoration: InputDecoration(
                    hintText: 'गटाचे नाव ',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 176, 109, 9))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
              child: Container(
                child: TextField(
                  controller: _actNameController,
                  decoration: InputDecoration(
                    hintText: 'उपक्रमाचे नाव ',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 176, 109, 9))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
              child: Container(
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'उपक्रमाबाबत माहिती',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
              child: Container(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _addressController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'उपक्रमाचे ठिकाण',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
              child: Container(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _dateController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'दिनांक',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 10,
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 188, 31, 7),
                    ),
                  ),
                  onPressed: _pickImageFromGallery,
                  child: const Text('Upload Image'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                child: _imageFile != null
                    ? Image.file(_imageFile!)
                    : const Text('No image selected.'),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 10,
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 188, 31, 7),
                ),
              ),
              onPressed: _submitForm,
              child: const Text(
                'Submit',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
