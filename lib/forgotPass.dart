import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => ForgotPassPageState();
}

class ForgotPassPageState extends State<ForgotPassPage> {
  final TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _email.text.trim(),
      );
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'Password reset link sent! Check your email',
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              e.message.toString(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/umedlogo.png',height: 150,width: 350,),
            SizedBox(
              height: 50,
            ),

            const Text('Enter your  email to reset password',style: TextStyle(fontSize: 25),),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: TextFormField(
                  cursorColor: const Color.fromARGB(255, 119, 118, 118),
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 136, 134, 134),
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('Email ID'),
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 96, 94, 94),
                      fontSize: 15,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 226, 34, 20),
                        // Change this to your desired color
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email Id';
                    }
                    return null;
                  },
                ),
              ),
            ),

            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 249, 78, 62),
                  fixedSize: const Size(190, 40),
                ),
                onPressed: (){},
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    //color: Color.fromARGB(255, 255, 241, 114),

                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
