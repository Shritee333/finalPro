import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
//  final TextEditingController controller;
  final String labelText;
  //final bool obsecureText;

  const MyTextField({
    super.key,
    //required this.controller,
    required this.labelText,
    //required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextField(
        //  controller: controller,
        showCursor: true,
        cursorColor: const Color.fromARGB(255, 162, 160, 160),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 33, 33, 33),
            ),
          ),
        ),
      ),
    );
  }
}
