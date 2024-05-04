import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MemDetails extends StatefulWidget {
  const MemDetails({super.key});

  @override
  State<MemDetails> createState() => _MemDetailsState();
}

class _MemDetailsState extends State<MemDetails> {
  File? _imageFile;
  final TextEditingController _memName = TextEditingController();
  final TextEditingController _grpName = TextEditingController();
  final TextEditingController _entryDate = TextEditingController();
  final TextEditingController _role = TextEditingController();
  final TextEditingController _grpAcNo = TextEditingController();
  final TextEditingController _aadharCard = TextEditingController();
  final TextEditingController _phnNo = TextEditingController();
  final TextEditingController _husbName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _education = TextEditingController();
  final TextEditingController _maritalStatus = TextEditingController();
  final TextEditingController _anualIncome = TextEditingController();
  final TextEditingController _mainOccupation = TextEditingController();
  final TextEditingController _subOccupation = TextEditingController();
  final TextEditingController _caste = TextEditingController();
  final TextEditingController _religion = TextEditingController();
  final TextEditingController _memSocioStatus = TextEditingController();
  final TextEditingController _heirName = TextEditingController();
  final TextEditingController _heirAge = TextEditingController();
  final TextEditingController _heirRelation = TextEditingController();
  final TextEditingController _memAddress = TextEditingController();
  final TextEditingController _houseNo = TextEditingController();
  final TextEditingController _settlementName = TextEditingController();
  final TextEditingController _villageName = TextEditingController();
  final TextEditingController _talukaName = TextEditingController();
  final TextEditingController _stateName = TextEditingController();
  final TextEditingController _distName = TextEditingController();

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

  Future<void> storeImageAndDescriptionInFirestore(
    String imageUrl,
    String memName,
    String grpName,
    String entryDate,
    String role,
    String grpAcNo,
    String aadharCard,
    String phnNo,
    String husbName,
    String email,
    String dob,
    String age,
    String education,
    String maritalStatus,
    String anualIncome,
    String mainOccupation,
    String subOccupation,
    String caste,
    String religion,
    String memSocioStatus,
    String heirName,
    String heirAge,
    String heirRelation,
    String memAddress,
    String houseNo,
    String settlementName,
    String villageName,
    String talukaName,
    String stateName,
    String distName,
  ) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Store user information along with the image URL and description
        await FirebaseFirestore.instance.collection('memProfile').add(
          {
            'userId': user.uid, // User ID// Use// r name
            'userEmail': user.email ?? '', // User email
            'imageUrl': imageUrl,
            'memName': memName,
            'grpName': grpName,
            //'entryDate': DateTime.now().toIso8601String(),
            'entryDate': entryDate,
            'role': role,
            'grpAcNo': grpAcNo,
            'aadharCard': aadharCard,
            'phoneNo': phnNo,
            'husbName': husbName,
            'email': email,
            'dob': dob,
            'age': age,
            'education': education,
            'maritalStatus': maritalStatus,
            'anualIncome': anualIncome,
            'mainOccupation': mainOccupation,
            'subOccupation': subOccupation,
            'caste': caste,
            'religion': religion,
            'socioStatus': memSocioStatus,
            'heirName': heirName,
            'heirAge': heirAge,
            'heirRelation': heirRelation,
            'memAddress': memAddress,
            'settlement': settlementName,
            'village': villageName,
            'taluka': talukaName,
            'distName': distName
          },
        );
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

  Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('memProfile/$fileName');
      await firebaseStorageRef.putFile(imageFile);
      String imageUrl = await firebaseStorageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  Future<void> _submitForm() async {
    if (_imageFile == null) {
      Fluttertoast.showToast(msg: 'No image selected.');
      return;
    }

    String? imageUrl = await uploadImageToFirebaseStorage(_imageFile!);
    if (imageUrl != null) {
      // Get the user's name from the TextField
      String memName = _memName.text;
      String grpName = _grpName.text;
      String entryDate = _entryDate.text;
      String role = _role.text;
      String grpAcNo = _grpAcNo.text;
      String aadharCard = _aadharCard.text;
      String phnNo = _phnNo.text;
      String husbName = _husbName.text;
      String email = _email.text;
      String dob = _dob.text;
      String age = _age.text;
      String education = _education.text;
      String maritalStatus = _maritalStatus.text;
      String anualIncome = _anualIncome.text;
      String mainOccupation = _mainOccupation.text;
      String subOccupation = _subOccupation.text;
      String caste = _caste.text;
      String religion = _religion.text;
      String memSocioStatus = _memSocioStatus.text;
      String heirName = _heirName.text;
      String heirAge = _heirAge.text;
      String heirRelation = _heirRelation.text;
      String memAddress = _memAddress.text;
      String houseNo = _houseNo.text;
      String settlementName = _settlementName.text;
      String villageName = _villageName.text;
      String talukaName = _talukaName.text;
      String stateName = _stateName.text;
      String distName = _distName.text;

      await storeImageAndDescriptionInFirestore(
        imageUrl,
        memName,
        grpName,
        entryDate,
        role,
        grpAcNo,
        aadharCard,
        phnNo,
        husbName,
        email,
        dob,
        age,
        education,
        maritalStatus,
        anualIncome,
        mainOccupation,
        subOccupation,
        caste,
        religion,
        memSocioStatus,
        heirName,
        heirAge,
        heirRelation,
        memAddress,
        houseNo,
        settlementName,
        villageName,
        talukaName,
        stateName,
        distName,
      );

      // Clear form fields and reset state
      _memName.clear();
      _grpName.clear();
      _entryDate.clear();
      _role.clear();
      _grpAcNo.clear();
      _aadharCard.clear();
      _phnNo.clear();
      _husbName.clear();
      _email.clear();
      _dob.clear();
      _age.clear();
      _education.clear();
      _maritalStatus.clear();
      _anualIncome.clear();
      _mainOccupation.clear();
      _subOccupation.clear();
      _caste.clear();
      _religion.clear();
      _memSocioStatus.clear();
      _heirName.clear();
      _heirAge.clear();
      _heirRelation.clear();
      _memAddress.clear();
      _houseNo.clear();
      _settlementName.clear();
      _villageName.clear();
      _talukaName.clear();
      _stateName.clear();
      _distName.clear();

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
        title: const Text('सदस्याचे वैयक्तिक पासबुक'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // const Center(
            //   child: Image(
            //     image: AssetImage(
            //       'assets/images/sgk.jpeg',
            //     ),
            //     height: 150,
            //   ),
            // ),

            TextButton(
              onPressed: _pickImageFromGallery,
              child: const Text('Upload Image'),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _memName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('सदस्याचे नाव'),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 34, 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _grpName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('स्वयंसहाय्यता समूहाचे नाव'),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 34, 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _entryDate,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('समूहातील प्रवेश दिनांक'),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 34, 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   margin: const EdgeInsets.symmetric(horizontal: 10),
            //   child: TextFormField(
            //     cursorColor: const Color.fromARGB(255, 119, 118, 118),
            //     controller: _role,
            //     decoration: InputDecoration(
            //       border: UnderlineInputBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       label: const Text('Role in Group'),
            //       labelStyle: const TextStyle(
            //         color: Colors.black,
            //         fontSize: 18,
            //       ),
            //       focusedBorder: const UnderlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Color.fromARGB(255, 226, 34, 20),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _grpAcNo,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('समूहाचा खाते क्रमांक'),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 34, 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _aadharCard,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('आधार कार्ड नं'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _phnNo,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('फोन नंबर'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _husbName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('पतीचे नाव'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _email,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('ईमेल आयडी'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _dob,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('जन्म दिनांक'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _age,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('वय'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _education,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('शिक्षण'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _maritalStatus,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('वैवाहिक स्थिती'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _anualIncome,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('वार्षिक उत्पन्न (रु.)'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _mainOccupation,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('मुख्य व्यवसाय'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _subOccupation,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('पुरक व्यवसाय'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _caste,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('जात'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _religion,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('धर्म'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _memSocioStatus,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text(
                      'सदस्याची सामाजिक स्थिती:(अतिगरीब / गरीब / मध्यम)'),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 34, 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _heirName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('सदस्याच्या वारसदाराचे नाव'),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 34, 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _heirAge,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('वारसदाराचे वय'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _heirRelation,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('सदस्याशी नाते'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _memAddress,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('सदस्याचा पत्ता'),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 34, 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _houseNo,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('घर क्र.'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _settlementName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('वस्तीचे नाव '),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _villageName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('गाव'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _talukaName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('तालुका'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _distName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('जिल्हा'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: _stateName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('राज्य'),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                style: const ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 188, 31, 7),
                  ),
                ),
                child: const Text(
                  'Submit',
                ),
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final currentUserUid = user?.email;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('NUsers')
//                   .where('email', isEqualTo: currentUserUid)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return const Center(
//                     child: Text(
//                       'No data found for this user',
//                     ),
//                   );
//                 }

//                 final userData =
//                     snapshot.data!.docs.first.data() as Map<String, dynamic>;

//                 // return ListView(
//                 //   children: [
//                 //     ListTile(
//                 //       title: Text('Name: ${userData['name']}'),
//                 //       subtitle: Text('Email: ${userData['email']}'),
//                 //     ),
//                 //     // Add more ListTile widgets for other user data fields as needed
//                 //   ],
//                 // );
//                 return SingleChildScrollView(
//                   child: Column(children: [
//                     Padding(
//                         padding: const EdgeInsets.only(
//                             top: 80, bottom: 20, left: 8.0),
//                         child: Container(
//                           alignment: Alignment.topLeft,
//                           child: const Text(
//                             'PROFILE',
//                             style: TextStyle(
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         enabled: false,
//                         decoration: InputDecoration(
//                             label: Text(
//                               '${userData['name']}',
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10)),
//                             prefixIcon: const Icon(Icons.person)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                             enabled: false,
//                             label: Text(
//                               '${userData['email']}',
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10)),
//                             prefixIcon: const Icon(Icons.email)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         enabled: false,
//                         decoration: InputDecoration(
//                             label: Text(
//                               '${userData['contact']}',
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10)),
//                             prefixIcon: const Icon(Icons.call)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         enabled: false,
//                         decoration: InputDecoration(
//                             label: Text(
//                               '${userData['address']}',
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10)),
//                             prefixIcon: const Icon(Icons.location_on)),
//                       ),
//                     ),
//                   ]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//}

//class _MemDetailsState extends State<MemDetails> {
//   File? _imageFile;
//   TextEditingController _memName = TextEditingController();
//   TextEditingController grpName = TextEditingController();
//   TextEditingController entryDate = TextEditingController();
//   TextEditingController role = TextEditingController();
//   TextEditingController grpAcNo = TextEditingController();
//   TextEditingController aadharCard = TextEditingController();
//   TextEditingController phnNo = TextEditingController();
//   TextEditingController husbName = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController dob = TextEditingController();
//   TextEditingController age = TextEditingController();
//   TextEditingController education = TextEditingController();
//   TextEditingController maritalStatus = TextEditingController();
//   TextEditingController anualIncome = TextEditingController();
//   TextEditingController mainOccupation = TextEditingController();
//   TextEditingController subOccupation = TextEditingController();
//   TextEditingController cast = TextEditingController();
//   TextEditingController religion = TextEditingController();
//   TextEditingController memSocioStatus = TextEditingController();
//   TextEditingController heirName = TextEditingController();
//   TextEditingController heirAge = TextEditingController();
//   TextEditingController heirRelation = TextEditingController();
//   TextEditingController memAdress = TextEditingController();
//   TextEditingController houseNo = TextEditingController();
//   TextEditingController settlementName = TextEditingController();
//   TextEditingController villageName = TextEditingController();
//   TextEditingController talukaName = TextEditingController();
//   TextEditingController stateName = TextEditingController();
//   TextEditingController distName = TextEditingController();

//   Future<void> _pickImageFromGallery() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedImage != null) {
//         _imageFile = File(pickedImage.path);
//       } else {
//         Fluttertoast.showToast(
//             msg: 'No image selected.', gravity: ToastGravity.CENTER);
//       }
//     });
//   }

//   Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
//     try {
//       String fileName = imageFile.path.split('/').last;
//       Reference firebaseStorageRef =
//           FirebaseStorage.instance.ref().child('images/$fileName');
//       await firebaseStorageRef.putFile(imageFile);
//       String imageUrl = await firebaseStorageRef.getDownloadURL();
//       return imageUrl;
//     } catch (e) {
//       Fluttertoast.showToast(
//           msg: 'Error uploading image to Firebase Storage: $e');
//       return null;
//     }
//   }

//   Future<void> storeImageAndDescriptionInFirestore(
//     String imageUrl,
//     String memName,
//     String grpName,
//     String entryDate,
//     String role,
//     String grpAcNo,
//     String phnNo,
//     String husbName,
//     String dob,
//     String age,
//     String education,
//     String maritalStatus,
//     String anualIncome,
//     String mainOccupation,
//     String subOccupation,
//     String cast,
//     String religion,
//     String memSocioStatus,
//     String heirName,
//     String heirAge,
//     String heirRelation,
//     String memAdress,
//     String houseNo,
//     String settlementName,
//     String villageName,
//     String talukaName,
//     String stateName,
//     String distName,
//   ) async {
//     try {
//       // Get the current user
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // Store user information along with the image URL and description
//         await FirebaseFirestore.instance.collection('images').add({
//           'userId': user.uid, // User ID
//           'memName': memName,
//           'grpName': grpName,
//           'entryDate': entryDate,
//           'userEmail': user.email ?? '', // User email
//           'imageUrl': imageUrl,
//           'role': role,
//           'grpAcNo': grpAcNo,
//           'aadharCardNo': aadharCard,
//           'phnNo': phnNo,
//           'husbName': husbName,
//           'dob': dob,
//           'age': age,
//           'education': education,
//           'maritalStatus': maritalStatus,
//           'anualIncome': anualIncome,
//           'mainOccupation': mainOccupation,
//           'subOccupation': subOccupation,
//           'cast': cast,
//           'religion': religion,
//           'memSocioStatus': memSocioStatus,
//           'heirName': heirName,
//           'heirAge': heirAge,
//           'heirRelation': heirRelation,
//           'memAdress': memAdress,
//           'houseNo': houseNo,
//           'settlementName': settlementName,
//           'villageName': villageName,
//           'talukaName': talukaName,
//           'stateName': stateName,
//           'distName': distName,
//         });
//         Fluttertoast.showToast(
//             msg: 'Image and description stored successfully  ');
//       } else {
//         Fluttertoast.showToast(msg: 'No user signed in.');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(
//           msg: 'Error storing image and description in Firestore: $e');
//     }
//   }

//   Future<void> _submitForm() async {
//     if (_imageFile == null) {
//       Fluttertoast.showToast(msg: 'No image selected.');
//       return;
//     }

//     String? imageUrl = await uploadImageToFirebaseStorage(_imageFile!);
//     if (imageUrl != null) {
//       String grpName =
//           _grpNameController.text; // Get the user's name from the TextField
//       String actName = _actNameController.text;
//       String description =
//           _descriptionController.text; // Get the description from the TextField
//       String address = _addressController.text;
//       String date = _dateController.text;
//       String memName = _memName.text;
//       await storeImageAndDescriptionInFirestore(
//           imageUrl, description, grpName, actName, address, date, memName);

//       // Clear form fields and reset state
//       // _grpNameController.clear();
//       // _actNameController.clear();
//       // _descriptionController.clear();
//       // _addressController.clear();
//       // _dateController.clear();
//       setState(() {
//         _imageFile = null;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 188, 31, 7),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: const Text(
//           'उपक्रम',
//           style: TextStyle(
//             fontWeight: FontWeight.w100,
//             color: Color.fromARGB(255, 255, 255, 255),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 10),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                           decoration: const BoxDecoration(),
//                           child: const Center(
//                             child: Text(
//                               'गटांतर्गत राबवलेले उपक्रम',
//                               style: TextStyle(
//                                 fontSize: 27,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
//               child: Container(
//                 child: TextField(
//                   cursorColor: const Color.fromARGB(115, 98, 96, 96),
//                   controller: _grpNameController,
//                   decoration: InputDecoration(
//                     hintText: 'गटाचे नाव ',
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 176, 109, 9))),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
//               child: Container(
//                 child: TextField(
//                   controller: _actNameController,
//                   decoration: InputDecoration(
//                     hintText: 'उपक्रमाचे नाव ',
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 176, 109, 9))),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
//               child: Container(
//                 child: TextField(
//                   controller: _descriptionController,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     hintText: 'उपक्रमाबाबत माहिती',
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.orange)),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
//               child: Container(
//                 child: TextField(
//                   cursorColor: Colors.black,
//                   controller: _addressController,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     hintText: 'उपक्रमाचे ठिकाण',
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.orange)),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
//               child: Container(
//                 child: TextField(
//                   cursorColor: Colors.black,
//                   controller: _dateController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     hintText: 'दिनांक',
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.orange)),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 margin: const EdgeInsets.only(
//                   top: 20,
//                 ),
//                 child: ElevatedButton(
//                   style: const ButtonStyle(
//                     padding: MaterialStatePropertyAll(
//                       EdgeInsets.symmetric(
//                         horizontal: 60,
//                         vertical: 10,
//                       ),
//                     ),
//                     backgroundColor: MaterialStatePropertyAll(
//                       Color.fromARGB(255, 188, 31, 7),
//                     ),
//                   ),
//                   onPressed: _pickImageFromGallery,
//                   child: const Text('Upload Image'),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 250,
//                 child: _imageFile != null
//                     ? Image.file(_imageFile!)
//                     : const Text('No image selected.'),
//               ),
//             ),
//             ElevatedButton(
//               style: const ButtonStyle(
//                 padding: MaterialStatePropertyAll(
//                   EdgeInsets.symmetric(
//                     horizontal: 60,
//                     vertical: 10,
//                   ),
//                 ),
//                 backgroundColor: MaterialStatePropertyAll(
//                   Color.fromARGB(255, 188, 31, 7),
//                 ),
//               ),
//               onPressed: _submitForm,
//               child: const Text(
//                 'Submit',
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
