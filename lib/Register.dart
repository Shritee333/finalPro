import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HomeScreen.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();
  final addController = TextEditingController();
  final contController = TextEditingController();

  bool _isObscured = true; // Flag to track password visibility

  void createAccount() async {
    String name = nameController.text.trim();
    String password = passController.text.trim();
    String email = emailController.text.trim();
    String address = addController.text.trim();
    String contact = contController.text.trim();

    if (name == "" ||
        password == "" ||
        email == "" ||
        address == "" ||
        contact == "") {
      Fluttertoast.showToast(
          msg: 'Enter valid inputs', gravity: ToastGravity.CENTER);
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
          msg: 'User created successfully', gravity: ToastGravity.CENTER);

      // Store user data in Firestore along with FCM token
      await FirebaseFirestore.instance
          .collection('NUsers')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
        'password': password,
        'address': address,
        'contact': contact,
        'userId': userCredential.user!.uid, // Store userId
      });

      // Navigate to home page or next screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (ex) {
      Fluttertoast.showToast(
          msg: ex.code.toString(), gravity: ToastGravity.CENTER);
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  // signInWithGoogle()async{
  //
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? gooleAuth = await googleUser?.authentication;
  //   AuthCredential credential= GoogleAuthProvider.credential(
  //     accessToken: gooleAuth?.accessToken,
  //     idToken: gooleAuth?.idToken,
  //
  //   );
  //   UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
  //   print(userCredential.user?.displayName);
  // }

  Future<void> signInWithGoogle() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: const Text('Sign up',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: Icon(_isObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: contController,
                    decoration: InputDecoration(
                      hintText: 'Contact no.',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.phone),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: 275,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent),
                    child: TextButton(
                      onPressed: createAccount,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 85),
                      child: SizedBox(child: Text("Already have an account?")),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
