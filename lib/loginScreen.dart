import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_pro/RegisterScreen.dart';
import 'package:final_pro/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'forgotPass.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'adminHomeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _isObscure3 = true;
  // bool visible = false;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  // var isLogin = false;

  // checkIfLogin() async {
  //   _auth.authStateChanges().listen(
  //     (User? user) {
  //       if (user != null && mounted) {
  //         setState(
  //           () {
  //             isLogin = true;
  //           },
  //         );
  //       }
  //     },
  //   );
  //}

  // @override
  // void initState() {
  //   checkIfLogin();
  //   super.initState();
  // }

  bool _isObscured = true; // Flag to track password visibility
  bool _isLoading = false;

  void login() async {
    String email = emailController.text.trim();
    String password = passController.text.trim();

    if (email == "" || password == "") {
      Fluttertoast.showToast(
          msg: 'Please fill all the fields', gravity: ToastGravity.CENTER);
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        var adminQuery = await FirebaseFirestore.instance
            .collection('admin')
            .where('email', isEqualTo: email)
            .get();

        if (adminQuery.docs.isNotEmpty) {
          Fluttertoast.showToast(
              msg: 'Admin Login Successfully', gravity: ToastGravity.CENTER);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminHome()));
        } else {
          Fluttertoast.showToast(
              msg: 'User Login Successfully', gravity: ToastGravity.CENTER);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } on FirebaseAuthException catch (ex) {
        Fluttertoast.showToast(
            msg: ex.code.toString(), gravity: ToastGravity.CENTER);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    //_auth.signOut();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    'assets/images/umedlogo.png',
                    width: 350,
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 136, 134, 134),
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('Email'),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 96, 94, 94),
                          fontSize: 15,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter a valid email");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: passController,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 136, 134, 134),
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _isObscured = !_isObscured;
                              },
                            );
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('Password'),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 96, 94, 94),
                          fontSize: 15,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 226, 34, 20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (!regex.hasMatch(value)) {
                          return ("please enter valid password min. 6 character");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        passController.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPassPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 249, 78, 62),
                        fixedSize: const Size(120, 40),
                      ),
                      // onPressed: _login, // Call _login() method when pressed
                      onPressed: () {
                        login();
                        //setState(
                        //   () {
                        //     visible = true;
                        //   },
                        // );
                        // signIn(emailController.text, passwordController.text);
                      },
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Color.fromARGB(255, 94, 7, 7),
                            )
                          : const Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 241, 114),
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a register',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//   void route() {
//     User? user = FirebaseAuth.instance.currentUser;
//     var _auth =
//         FirebaseFirestore.instance.collection('user').doc(user!.uid).get().then(
//       (DocumentSnapshot documentSnapshot) {
//         if (documentSnapshot.exists) {
//           if (documentSnapshot.get('roll') == "Admin") {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     isLogin ? const HomePage() : const RegistrationPage(),
//               ),
//             );
//           } else {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     isLogin ? const RegistrationPage() : const HomePage(),
//               ),
//             );
//           }
//         } else {
//           print('Document does not exist on the database');
//         }
//       },
//     );
//   }

//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         route();
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided for that user.');
//         }
//       }
//     }
//     emailController.clear();
//     passwordController.clear();
//   }
// }
