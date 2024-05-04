import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DepositExpFile extends StatefulWidget {
  const DepositExpFile({super.key});

  @override
  State<DepositExpFile> createState() => _DepositExpFileState();
}

class _DepositExpFileState extends State<DepositExpFile> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];

  Future<String?> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");

    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() {});

    final downloadLink = await reference.getDownloadURL();
    return downloadLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadLink = await uploadPdf(fileName, file);

      await _firebaseFirestore.collection("pdfs").add({
        "name": fileName,
        "url": downloadLink,
      });
      print("Pdf Uploaded Successfully.");
    }
  }

  void getAllPdf() async {
    final result = await _firebaseFirestore.collection("pdfs").get();
    pdfData = result.docs.map((e) => e.data()).toList();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'जमा-खर्च नोंदवही',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
          ),
        ),
      ),
      body: GridView.builder(
        //itemCount: 10,
        itemCount: pdfData.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 8,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PdfViewer(pdfUrl: pdfData[index]['url'])));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/pdf.png",
                      height: 70,
                      width: 70,
                    ),
                    Center(
                      child: Text(
                        //"Pdf name",
                        pdfData[index]['name'],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickFile,
        //onPressed: (){},
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        // Color.fromARGB(255, 188, 31, 7)
        child: const Icon(
          color: Colors.white,
          Icons.upload_file,
        ),
      ),
    );
  }
}

class PdfViewer extends StatefulWidget {
  final String pdfUrl;
  const PdfViewer({
    super.key,
    required this.pdfUrl,
  });

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  PDFDocument? document;

  void initializePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: document != null
            ? PDFViewer(
                document: document!,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
