// // // import 'dart:convert';
// // // import 'dart:html';
// //
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'MyTextField.dart';
// //
// // // class MemPerPass extends StatefulWidget {
// // //   const MemPerPass({
// // //     super.key,
// // //   });
// //
// // //   @override
// // //   State<MemPerPass> createState() => _MemPerPassState();
// // // }
// //
// // // class _MemPerPassState extends State<MemPerPass> {
// // //   final _auth = FirebaseAuth.instance.currentUser!;
// // //   // List<String> docIDs = [];
// // //   // Future getDocId() async {
// // //   //   await FirebaseFirestore.instance.collection('personalPass').get().then(
// // //   //         (snapshot) => snapshot.docs.forEach((document) {
// // //   //           print(document.reference);
// // //   //           docIDs.add(document.reference.id);
// // //   //         }),
// // //   //       );
// // //   // }
// //
// // //   @override
// // //   void initState() {
// // //    // getDocId();
// // //     super.initState();
// // //   }
// //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: const Color.fromARGB(255, 188, 31, 7),
// // //         title: const Text(
// // //           'सदस्याचे वैयक्तिक पासबुक',
// // //           style: TextStyle(
// // //             fontWeight: FontWeight.w100,
// // //             color: Color.fromARGB(255, 255, 255, 255),
// // //           ),
// // //         ),
// // //       ),
// // //       body: const SingleChildScrollView(
// // //         padding: EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             SizedBox(
// // //               height: 10,
// // //             ),
// // //             Center(
// // //               child: Text(
// // //                 'व्यक्तिगत',
// // //                 style: TextStyle(
// // //                   fontWeight: FontWeight.bold,
// // //                   fontSize: 24,
// // //                   color: Color.fromARGB(255, 78, 32, 9),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // // import 'dart:html';
// //
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// //
// // // class MemPerPass extends StatefulWidget {
// // //   const MemPerPass({super.key});
// //
// // //   @override
// // //   State<MemPerPass> createState() => _MemPerPassState();
// // // }
// //
// // // class _MemPerPassState extends State<MemPerPass> {
// // //   TextEditingController email = TextEditingController();
// // //   TextEditingController username = TextEditingController();
// // //   TextEditingController password = TextEditingController();
// //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Padding(
// // //         padding: EdgeInsets.all(
// // //           10,
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(8),
// // //             ),
// // //             Container(
// // //               child: TextField(
// // //                 controller: email,
// // //                 decoration: InputDecoration(
// // //                   border: UnderlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                   label: const Text('email'),
// // //                   labelStyle: const TextStyle(
// // //                     color: Colors.black,
// // //                     fontSize: 18,
// // //                   ),
// // //                   focusedBorder: const UnderlineInputBorder(
// // //                     borderSide: BorderSide(
// // //                       color: Color.fromARGB(255, 226, 34, 20),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 onChanged: (value) {},
// // //               ),
// // //             ),
// // //             Container(
// // //               child: TextField(
// // //                 controller: username,
// // //                 decoration: InputDecoration(
// // //                   border: UnderlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                   label: const Text('username'),
// // //                   labelStyle: const TextStyle(
// // //                     color: Colors.black,
// // //                     fontSize: 18,
// // //                   ),
// // //                   focusedBorder: const UnderlineInputBorder(
// // //                     borderSide: BorderSide(
// // //                       color: Color.fromARGB(255, 226, 34, 20),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 onChanged: (value) {},
// // //               ),
// // //             ),
// // //             Container(
// // //               child: TextField(
// // //                 controller: password,
// // //                 obscureText: true,
// // //                 decoration: InputDecoration(
// // //                   border: UnderlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                   label: const Text('password'),
// // //                   labelStyle: const TextStyle(
// // //                     color: Colors.black,
// // //                     fontSize: 18,
// // //                   ),
// // //                   focusedBorder: const UnderlineInputBorder(
// // //                     borderSide: BorderSide(
// // //                       color: Color.fromARGB(255, 226, 34, 20),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 onChanged: (value) {},
// // //               ),
// // //             ),
// // //             Center(
// // //               child: ElevatedButton(
// // //                 style: const ButtonStyle(
// // //                   padding: MaterialStatePropertyAll(
// // //                     EdgeInsets.symmetric(
// // //                       horizontal: 60,
// // //                       vertical: 10,
// // //                     ),
// // //                   ),
// // //                   backgroundColor: MaterialStatePropertyAll(
// // //                     Color.fromARGB(255, 188, 31, 7),
// // //                   ),
// // //                 ),
// // //                 onPressed: () {
// // //                   CollectionReference collRef =
// // //                       FirebaseFirestore.instance.collection('users');
// // //                   collRef.add(
// // //                     {
// // //                       'email': email.text,
// // //                       'username': username.text,
// // //                       'password': password.text,
// // //                     },
// // //                   );
// // //                   email.clear();
// // //                   username.clear();
// // //                   password.clear();
// // //                 },
// // //                 child: const Text(
// // //                   'सबमिट',
// // //                   style: TextStyle(
// // //                     fontSize: 17,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             const Text(
// // //               'Welcome',
// // //             ),
// // //             StreamBuilder<QuerySnapshot>(
// // //                 stream:
// // //                     FirebaseFirestore.instance.collection('users').snapshots(),
// // //                 builder: (context, snapshot) {
// // //                   List<Row> usersWidgets = [];
// // //                   if (snapshot.hasData) {
// // //                     final user = snapshot.data?.docs.reversed.toList();
// // //                     for (var users in user!) {
// // //                       final usersWidget = Row(
// // //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                         children: [
// // //                           Text(users['email']),
// // //                           Text(users['username']),
// // //                           Text(users['password']),
// // //                         ],
// // //                       );
// // //                       usersWidgets.add(usersWidget);
// // //                     }
// // //                   }
// //
// // //                   return Expanded(
// // //                     child: ListView(
// // //                       children: usersWidgets,
// // //                     ),
// // //                   );
// // //                 })
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// // class MemPerPass extends StatefulWidget {
// //   const MemPerPass({super.key});
// //
// //   @override
// //   State<MemPerPass> createState() => _MemPerPassState();
// // }
// //
// // class _MemPerPassState extends State<MemPerPass> {
// //   TextEditingController totalLoanAmt = TextEditingController();
// //   TextEditingController purpose = TextEditingController();
// //   TextEditingController loanDistrDate = TextEditingController();
// //   TextEditingController interestRate = TextEditingController();
// //   TextEditingController emiCount = TextEditingController();
// //   TextEditingController emiAmt = TextEditingController();
// //   TextEditingController emiDuration = TextEditingController();
// //   TextEditingController date = TextEditingController();
// //   TextEditingController savingAmt = TextEditingController();
// //   TextEditingController savInterest = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(
// //           10,
// //         ),
// //         child: Column(
// //           children: [
// //             const Padding(
// //               padding: EdgeInsets.all(8),
// //             ),
// //             // Container(
// //             //   child: TextField(
// //             //     controller: email,
// //             //     decoration: InputDecoration(
// //             //       border: UnderlineInputBorder(
// //             //         borderRadius: BorderRadius.circular(8),
// //             //       ),
// //             //       label: const Text('email'),
// //             //       labelStyle: const TextStyle(
// //             //         color: Colors.black,
// //             //         fontSize: 18,
// //             //       ),
// //             //       focusedBorder: const UnderlineInputBorder(
// //             //         borderSide: BorderSide(
// //             //           color: Color.fromARGB(255, 226, 34, 20),
// //             //         ),
// //             //       ),
// //             //     ),
// //             //     onChanged: (value) {},
// //             //   ),
// //             // ),
// //             // Container(
// //             //   child: TextField(
// //             //     controller: username,
// //             //     decoration: InputDecoration(
// //             //       border: UnderlineInputBorder(
// //             //         borderRadius: BorderRadius.circular(8),
// //             //       ),
// //             //       label: const Text('username'),
// //             //       labelStyle: const TextStyle(
// //             //         color: Colors.black,
// //             //         fontSize: 18,
// //             //       ),
// //             //       focusedBorder: const UnderlineInputBorder(
// //             //         borderSide: BorderSide(
// //             //           color: Color.fromARGB(255, 226, 34, 20),
// //             //         ),
// //             //       ),
// //             //     ),
// //             //     onChanged: (value) {},
// //             //   ),
// //             // ),
// //             // Container(
// //             //   child: TextField(
// //             //     controller: password,
// //             //     obscureText: true,
// //             //     decoration: InputDecoration(
// //             //       border: UnderlineInputBorder(
// //             //         borderRadius: BorderRadius.circular(8),
// //             //       ),
// //             //       label: const Text('password'),
// //             //       labelStyle: const TextStyle(
// //             //         color: Colors.black,
// //             //         fontSize: 18,
// //             //       ),
// //             //       focusedBorder: const UnderlineInputBorder(
// //             //         borderSide: BorderSide(
// //             //           color: Color.fromARGB(255, 226, 34, 20),
// //             //         ),
// //             //       ),
// //             //     ),
// //             //     onChanged: (value) {},
// //             //   ),
// //             // ),
// //             // Center(
// //             //   child: ElevatedButton(
// //             //     style: const ButtonStyle(
// //             //       padding: MaterialStatePropertyAll(
// //             //         EdgeInsets.symmetric(
// //             //           horizontal: 60,
// //             //           vertical: 10,
// //             //         ),
// //             //       ),
// //             //       backgroundColor: MaterialStatePropertyAll(
// //             //         Color.fromARGB(255, 188, 31, 7),
// //             //       ),
// //             //     ),
// //             //     onPressed: () {
// //             //       CollectionReference collRef =
// //             //           FirebaseFirestore.instance.collection('users');
// //             //       collRef.add(
// //             //         {
// //             //           'email': email.text,
// //             //           'username': username.text,
// //             //           'password': password.text,
// //             //         },
// //             //       );
// //             //       email.clear();
// //             //       username.clear();
// //             //       password.clear();
// //             //     },
// //             //     child: const Text(
// //             //       'सबमिट',
// //             //       style: TextStyle(
// //             //         fontSize: 17,
// //             //       ),
// //             //     ),
// //             //   ),
// //             // ),
// //             // const Text(
// //             //   'Welcome',
// //             // ),
// //             StreamBuilder<QuerySnapshot>(
// //                 stream: FirebaseFirestore.instance
// //                     .collection('personalPass')
// //                     .snapshots(),
// //                 builder: (context, snapshot) {
// //                   List<Row> personalPassWidgets = [];
// //                   if (snapshot.hasData) {
// //                     final user = snapshot.data?.docs.reversed.toList();
// //                     for (var personalPass in user!) {
// //                       final personalPassWidget = Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Text(personalPass['EmiAmt']),
// //                           Text(personalPass['EmiCount']),
// //                           Text(personalPass['EmiDuration']),
// //                           Text(personalPass['InterestRate']),
// //                           Text(personalPass['LoanDistrDate']),
// //                           Text(personalPass['Purpose']),
// //                           Text(personalPass['SavInterest']),
// //                           Text(personalPass['SavingAmt']),
// //                           Text(personalPass['TotalLoanAmt']),
// //                           Text(personalPass['date']),
// //                         ],
// //                       );
// //                       personalPassWidgets.add(personalPassWidget);
// //                     }
// //                   }
// //
// //                   return Expanded(
// //                     child: ListView(
// //                       children: personalPassWidgets,
// //                     ),
// //                   );
// //                 })
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
// //
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:final_pro/MyTextFormField.dart';
// //
// // class MemPerPass extends StatefulWidget {
// //   const MemPerPass({
// //     super.key,
// //   });
// //
// //   @override
// //   State<MemPerPass> createState() => _MemPerPassState();
// // }
// //
// // class _MemPerPassState extends State<MemPerPass> {
// //   TextEditingController totalLoanAmt = TextEditingController();
// //   TextEditingController purpose = TextEditingController();
// //   TextEditingController loanDistrDate = TextEditingController();
// //   TextEditingController interestRate = TextEditingController();
// //   TextEditingController emiCount = TextEditingController();
// //   TextEditingController emiAmt = TextEditingController();
// //   TextEditingController emiDuration = TextEditingController();
// //   TextEditingController date = TextEditingController();
// //   TextEditingController savingAmt = TextEditingController();
// //   TextEditingController savInterest = TextEditingController();
// //   // TextEditingController totalLoanAmt = TextEditingController();
// //   // TextEditingController purpose = TextEditingController();
// //   // TextEditingController loanDistrDate = TextEditingController();
// //   // TextEditingController interestRate = TextEditingController();
// //   // TextEditingController emiCount = TextEditingController();
// //   // TextEditingController emiAmt = TextEditingController();
// //   // TextEditingController emiDuration = TextEditingController();
// //   // TextEditingController date = TextEditingController();
// //   // TextEditingController savingAmt = TextEditingController();
// //   // TextEditingController savInterest = TextEditingController();
// //   // TextEditingController totalLoanAmt = TextEditingController();
// //   // TextEditingController purpose = TextEditingController();
// //   // TextEditingController loanDistrDate = TextEditingController();
// //   // TextEditingController interestRate = TextEditingController();
// //   // TextEditingController emiCount = TextEditingController();
// //   // TextEditingController emiAmt = TextEditingController();
// //   // TextEditingController emiDuration = TextEditingController();
// //   // TextEditingController date = TextEditingController();
// //   // TextEditingController savingAmt = TextEditingController();
// //   // TextEditingController savInterest = TextEditingController();
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final user= FirebaseAuth.instance.currentUser;
// //     final currentUserUid = user?.email;
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color.fromARGB(255, 188, 31, 7),
// //         title: const Text(
// //           'सदस्याचे वैयक्तिक पासबुक',
// //           style: TextStyle(
// //             fontWeight: FontWeight.w100,
// //             color: Color.fromARGB(255, 255, 255, 255),
// //           ),
// //         ),
// //       ),
// //       body:
// //
// //       Column(
// //         children: [
// //
// //       Expanded(
// //       child: StreamBuilder<QuerySnapshot>(
// //     stream: FirebaseFirestore.instance
// //         .collection('personalPass')
// //         .where('email', isEqualTo: currentUserUid)
// //         .snapshots(),
// //     builder: (context, snapshot) {
// //       if (snapshot.connectionState == ConnectionState.waiting) {
// //         return const Center(child: CircularProgressIndicator());
// //       }
// //
// //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //         return const Center(
// //           child: Text(
// //             'No data found for this user',
// //           ),
// //         );
// //       }
// //
// //       final userData =
// //       snapshot.data!.docs.first.data() as Map<String, dynamic>;
// //
// //       return Column(
// //         children: [
// //           Text(userData['EmiAmt']),
// //           Text(userData['date']),
// //         ],
// //       );
// //       // return SingleChildScrollView(
// //       //   padding: const EdgeInsets.all(16.0),
// //       //   child: Column(
// //       //     crossAxisAlignment: CrossAxisAlignment.start,
// //       //     children: [
// //       //       const Center(
// //       //         child: Text(
// //       //           'व्यक्तिगत',
// //       //           style: TextStyle(
// //       //             fontWeight: FontWeight.bold,
// //       //             fontSize: 24,
// //       //             color: Color.fromARGB(255, 78, 32, 9),
// //       //           ),
// //       //         ),
// //       //       ),
// //       //       const SizedBox(
// //       //         height: 10,
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: totalLoanAmt,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('एकूण कर्जाची रक्कम (रु.)'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: purpose,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('उद्देश'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: loanDistrDate,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('कर्ज वितरण दिनांक'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       const SizedBox(
// //       //         height: 15,
// //       //       ),
// //       //       const Center(
// //       //         child: Text(
// //       //           'कर्ज विवरण',
// //       //           style: TextStyle(
// //       //             fontWeight: FontWeight.bold,
// //       //             fontSize: 24,
// //       //             color: Color.fromARGB(255, 78, 32, 9),
// //       //           ),
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: interestRate,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('व्याज दर'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: emiCount,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('हफ्त्यांची संख्या'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: emiAmt,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('हफ्त्यांची रक्कम रु. '),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: emiDuration,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('हफ्त्यांचा कालावधी '),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       const SizedBox(
// //       //         height: 15,
// //       //       ),
// //       //       const Center(
// //       //         child: Text(
// //       //           'बचत माहिती',
// //       //           style: TextStyle(
// //       //             fontWeight: FontWeight.bold,
// //       //             fontSize: 24,
// //       //             color: Color.fromARGB(255, 78, 32, 9),
// //       //           ),
// //       //         ),
// //       //       ),
// //       //       const SizedBox(height: 15),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: date,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('दिनांक'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: savingAmt,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('बचत रु.'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       Container(
// //       //         padding: const EdgeInsets.all(5),
// //       //         margin: const EdgeInsets.symmetric(horizontal: 10),
// //       //         child: TextFormField(
// //       //           cursorColor: const Color.fromARGB(255, 119, 118, 118),
// //       //           controller: savInterest,
// //       //           decoration: InputDecoration(
// //       //             border: UnderlineInputBorder(
// //       //               borderRadius: BorderRadius.circular(8),
// //       //             ),
// //       //             label: const Text('बचतीवरील व्याज'),
// //       //             labelStyle: const TextStyle(
// //       //               color: Colors.black,
// //       //               fontSize: 18,
// //       //             ),
// //       //             focusedBorder: const UnderlineInputBorder(
// //       //               borderSide: BorderSide(
// //       //                 color: Color.fromARGB(255, 226, 34, 20),
// //       //               ),
// //       //             ),
// //       //           ),
// //       //           onChanged: (value) {},
// //       //         ),
// //       //       ),
// //       //       const SizedBox(
// //       //         height: 40,
// //       //       ),
// //       //       Center(
// //       //         child: ElevatedButton(
// //       //           style: const ButtonStyle(
// //       //             padding: MaterialStatePropertyAll(
// //       //               EdgeInsets.symmetric(
// //       //                 horizontal: 60,
// //       //                 vertical: 10,
// //       //               ),
// //       //             ),
// //       //             backgroundColor: MaterialStatePropertyAll(
// //       //               Color.fromARGB(255, 188, 31, 7),
// //       //             ),
// //       //           ),
// //       //           onPressed: () {
// //       //             CollectionReference collRef =
// //       //             FirebaseFirestore.instance.collection('personalPass');
// //       //             collRef.add({
// //       //               'TotalLoanAmt': totalLoanAmt.text,
// //       //               'Purpose': purpose.text,
// //       //               'LoanDistrDate': loanDistrDate.text,
// //       //               'InterestRate': interestRate.text,
// //       //               'EmiCount': emiCount.text,
// //       //               'EmiAmt': emiAmt.text,
// //       //               'EmiDuration': emiDuration.text,
// //       //               'date': date.text,
// //       //               'SavingAmt': savingAmt.text,
// //       //               'SavInterest': savInterest.text,
// //       //             });
// //       //           },
// //       //           child: const Text(
// //       //             'सबमिट',
// //       //             style: TextStyle(
// //       //               fontSize: 17,
// //       //             ),
// //       //           ),
// //       //         ),
// //       //       ),
// //       //       const SizedBox(
// //       //         height: 20,
// //       //       ),
// //       //       // const Text('Client Details'),
// //       //       // const SizedBox(
// //       //       //   height: 10,
// //       //       // ),
// //       //       // StreamBuilder<QuerySnapshot>(
// //       //       //   stream: FirebaseFirestore.instance
// //       //       //       .collection('personalPass')
// //       //       //       .snapshots(),
// //       //       //   builder: (context, snapshot) {
// //       //       //     List<Row> clientWidgets = [];
// //       //       //     if (snapshot.hasData) {
// //       //       //       final perPass = snapshot.data?.docs.reversed.toList();
// //       //       //       for (var client in perPass!) {
// //       //       //         final clientWidget = Row(
// //       //       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       //       //           children: [
// //       //       //             Text(client['name']),
// //       //       //           ],
// //       //       //         );
// //       //       //         clientWidgets.add(clientWidget);
// //       //       //       }
// //       //       //     }
// //       //
// //       //       //     return Expanded(
// //       //       //       child: ListView(
// //       //       //         children: clientWidgets,
// //       //       //       ),
// //       //       //     );
// //       //       //   },
// //       //       // ),
// //       //     ],
// //       //   ),
// //       // );
// //     },
// //     )
// //       )
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
//

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemPerPass extends StatefulWidget {
  const MemPerPass({Key? key}) : super(key: key);

  @override
  State<MemPerPass> createState() => _MemPerPassState();
}

class _MemPerPassState extends State<MemPerPass> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final currentUserUid = user?.email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'सदस्याचे वैयक्तिक पासबुक',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('perPass')
            .where('userEmail', isEqualTo: currentUserUid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No data found for this user',
              ),
            );
          }

          // Ensure that only one document is retrieved
          final userData =
              snapshot.data!.docs.first.data() as Map<String, dynamic>;

          // Debugging: Print userData to check if it contains the expected data
          print('User Data: $userData');

          // Example of accessing fields from userData
          final emiAmt = userData['EmiAmt'];
          final date = userData['date'];
          // final email = userData['email'];

          return Column(
            children: [
              Text('EMI Amount: $emiAmt', style: const TextStyle(fontSize: 20),),
              Text('Date: $date', ),
              //  Text('email: $email')
            ],
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class TransactionDataPage extends StatefulWidget {
//   final String email;

//   const TransactionDataPage(this.email, {super.key});

//   @override
//   State<TransactionDataPage> createState() => _TransactionDataPageState();
// }

// class _TransactionDataPageState extends State<TransactionDataPage> {
//   late DatabaseReference _databaseReference;

//   @override
//   void initState() {
//     super.initState();
//     _databaseReference =
//         FirebaseDatabase.instance.ref().child('transaction_data');
//     _databaseReference
//         .orderByChild('email')
//         .equalTo(widget.email)
//         .onValue
//         .listen((DatabaseEvent event) {
//       final data = event.snapshot.value as Map?;
//       if (data != null) {
//         setState(() {});
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Transaction Data for ${widget.email}'),
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     if (_databaseReference == null) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       final data = _databaseReference as Map;
//       return ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           final transaction = data[index] as Map;
//           return ListTile(
//             title: Text(transaction['title'] as String),
//             subtitle: Text(transaction['description'] as String),
//             leading: CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: Text(
//                 (index + 1).toString(),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//             trailing: Text(transaction['date'] as String),
//           );
//         },
//       );
//     }
//   }
// }
