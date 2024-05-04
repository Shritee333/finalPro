import 'package:flutter/material.dart';
import 'package:final_pro/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HomeScreen.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
//_RegistrationPageState();

  // bool showProgress = false;
  // bool visible = false;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController contController = TextEditingController();

  bool _isObscure = true;
  // bool _isObscure2 = true;
  // File? file;
  // var options = [
  //   'User',
  //   'Admin',
  // ];
  // var _currentItemSelected = "User";
  // var roll = "Admin";

  void createAccount() async {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
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
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } on FirebaseAuthException catch (ex) {
      Fluttertoast.showToast(
          msg: ex.code.toString(), gravity: ToastGravity.CENTER);
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Future<void> signInWithGoogle() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/umedlogo.png',
                    width: 350,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 136, 134, 134),
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('Name'),
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
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
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
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 136, 134, 134),
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.white,
                        enabled: true,
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
                      onChanged: (value) {},
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: addController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.home,
                          color: Color.fromARGB(255, 136, 134, 134),
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('Address'),
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
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 119, 118, 118),
                      controller: contController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 136, 134, 134),
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text('Contact'),
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
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 249, 78, 62),
                        fixedSize: const Size(120, 40),
                      ),
                      onPressed: () {
                        // setState(
                        //   () {
                        //     showProgress = true;
                        //   },
                        // );
                        // signUp(emailController.text, usernameController.text,
                        //     passwordController.text, roll);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomePage(),
                        //   ),
                        // );
                        createAccount();
                      },
                      child: const Text(
                        'Sign Up',
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
                        'Already registered ?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//   void signUp(
//       String email, String username, String password, String roll) async {
//     const CircularProgressIndicator();
//     if (_formKey.currentState!.validate()) {
//       await _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then(
//             (value) => {
//               postDetailsToFirestore(
//                 email,
//                 username,
//                 password,
//                 roll,
//               ),
//             },
//           )
//           .catchError((e) {});
//     }
//   }

//   postDetailsToFirestore(
//       String email, String username, String password, String roll) async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     var user = _auth.currentUser;
//     CollectionReference ref = FirebaseFirestore.instance.collection('user');
//     ref.doc(user!.uid).set(
//       {
//         'email': emailController.text,
//         'username': usernameController.text,
//         'password': passwordController.text,
//         'roll': roll,
//         'userId': user.uid,
//       },
//     );
//     emailController.clear();
//     usernameController.clear();
//     passwordController.clear();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const HomePage(),
//       ),
//     );
//   }
// }
