// Container(
// padding: const EdgeInsets.all(5),
// margin: const EdgeInsets.symmetric(horizontal: 10),
// child: TextFormField(
// cursorColor: const Color.fromARGB(255, 119, 118, 118),
// controller: loanDistrDate,
// decoration: InputDecoration(
// border: UnderlineInputBorder(
// borderRadius: BorderRadius.circular(8),
// ),
// label: const Text('कर्ज वितरण दिनांक'),
// labelStyle: const TextStyle(
// color: Colors.black,
// fontSize: 18,
// ),
// focusedBorder: const UnderlineInputBorder(
// borderSide: BorderSide(
// color: Color.fromARGB(255, 226, 34, 20),
// ),
// ),
// ),
// onChanged: (value) {},
// ),
// ),

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const MyTextFormField({super.key, required this.controller, required this.labelText,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        cursorColor: const Color.fromARGB(255, 119, 118, 118),
        controller: controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: labelText,
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
    ),);
  }
}
