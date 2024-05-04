import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MemPerPassForm extends StatefulWidget {
  const MemPerPassForm({
    super.key,
  });

  @override
  State<MemPerPassForm> createState() => _MemPerPassFormState();
}

class _MemPerPassFormState extends State<MemPerPassForm> {
  TextEditingController totalLoanAmt = TextEditingController();
  TextEditingController purpose = TextEditingController();
  TextEditingController loanDistrDate = TextEditingController();
  TextEditingController interestRate = TextEditingController();
  TextEditingController emiCount = TextEditingController();
  TextEditingController emiAmt = TextEditingController();
  TextEditingController emiDuration = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController savingAmt = TextEditingController();
  TextEditingController savInterest = TextEditingController();

  // TextEditingController totalLoanAmt = TextEditingController();
  // TextEditingController purpose = TextEditingController();
  // TextEditingController loanDistrDate = TextEditingController();
  // TextEditingController interestRate = TextEditingController();
  // TextEditingController emiCount = TextEditingController();
  // TextEditingController emiAmt = TextEditingController();
  // TextEditingController emiDuration = TextEditingController();
  // TextEditingController date = TextEditingController();
  // TextEditingController savingAmt = TextEditingController();
  // TextEditingController savInterest = TextEditingController();
  // TextEditingController totalLoanAmt = TextEditingController();
  // TextEditingController purpose = TextEditingController();
  // TextEditingController loanDistrDate = TextEditingController();
  // TextEditingController interestRate = TextEditingController();
  // TextEditingController emiCount = TextEditingController();
  // TextEditingController emiAmt = TextEditingController();
  // TextEditingController emiDuration = TextEditingController();
  // TextEditingController date = TextEditingController();
  // TextEditingController savingAmt = TextEditingController();
  // TextEditingController savInterest = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'व्यक्तिगत',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: totalLoanAmt,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('एकूण कर्जाची रक्कम (रु.)'),
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
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: purpose,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('उद्देश'),
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
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: loanDistrDate,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('कर्ज वितरण दिनांक'),
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
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                'कर्ज विवरण',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: interestRate,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('व्याज दर'),
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
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: emiCount,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('हफ्त्यांची संख्या'),
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
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: emiAmt,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('हफ्त्यांची रक्कम रु. '),
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
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: emiDuration,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('हफ्त्यांचा कालावधी '),
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
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                'बचत माहिती',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: date,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('दिनांक'),
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
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: savingAmt,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('बचत रु.'),
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
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: savInterest,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('बचतीवरील व्याज'),
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
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
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
                onPressed: () {
                  User? user = FirebaseAuth.instance.currentUser;

                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('perPass');
                  collRef.add({
                    'userId': user?.uid,
                    'userEmail': user?.email ?? '',
                    'TotalLoanAmt': totalLoanAmt.text,
                    'Purpose': purpose.text,
                    'LoanDistrDate': loanDistrDate.text,
                    'InterestRate': interestRate.text,
                    'EmiCount': emiCount.text,
                    'EmiAmt': emiAmt.text,
                    'EmiDuration': emiDuration.text,
                    'date': date.text,
                    'SavingAmt': savingAmt.text,
                    'SavInterest': savInterest.text,
                  });
                  // Future<void> storeImageAndDescriptionInFirestore(
                  //   String totalLoanAmt,
                  //   String purpose,
                  //   String loanDistrDate,
                  //   String interestRate,
                  //   String emiCount,
                  //   String emiAmt,
                  //   String emiDuration,
                  //   String date,
                  //   String savingAmt,
                  //   String savInterest,
                  // ) async {
                  //   try {
                  //     // Get the current user
                  //     User? user = FirebaseAuth.instance.currentUser;
                  //     if (user != null) {
                  //       // Store user information along with the image URL and description
                  //       await FirebaseFirestore.instance
                  //           .collection('perPass')
                  //           .add({
                  //         'userId': user.uid,
                  //         'userEmail': user.email ?? '',
                  //         'totalLoanAmt': totalLoanAmt,
                  //         'purpose': purpose,
                  //         'loanDistrDate': loanDistrDate,
                  //         'interestRate': interestRate,
                  //         'emiCount': emiCount,
                  //         'emiAmt': emiAmt,
                  //         'emiDuration': emiDuration,
                  //         'date': date,
                  //         'savingAmt': savingAmt,
                  //         'savInterest': savInterest,
                  //       });
                  //       Fluttertoast.showToast(
                  //           msg: 'Image and description stored successfully  ');
                  //     } else {
                  //       Fluttertoast.showToast(msg: 'No user signed in.');
                  //     }
                  //   } catch (e) {
                  //     Fluttertoast.showToast(
                  //         msg:
                  //             'Error storing image and description in Firestore: $e');
                  //   }
                  //}
                },
                child: const Text(
                  'सबमिट',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // const Text('Client Details'),
            // const SizedBox(
            //   height: 10,
            // ),
            // StreamBuilder<QuerySnapshot>(
            //   stream: FirebaseFirestore.instance
            //       .collection('personalPass')
            //       .snapshots(),
            //   builder: (context, snapshot) {
            //     List<Row> clientWidgets = [];
            //     if (snapshot.hasData) {
            //       final perPass = snapshot.data?.docs.reversed.toList();
            //       for (var client in perPass!) {
            //         final clientWidget = Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(client['name']),
            //           ],
            //         );
            //         clientWidgets.add(clientWidget);
            //       }
            //     }

            //     return Expanded(
            //       child: ListView(
            //         children: clientWidgets,
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// final _formKey = GlobalKey<FormState>();

// class MyForm extends StatefulWidget {
//   const MyForm({super.key});

//   @override
//   MyFormState createState() {
//     return MyFormState();
//   }
// }

// class MyFormState extends State<MyForm> {
//   final databaseRef = FirebaseDatabase.instance.ref();
//   final emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: <Widget>[
//           TextFormField(
//             controller: emailController,
//             enabled: false,
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the name';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the address';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the city';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the state';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the zip code';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the phone number';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the card number';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the expiration date';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the CVV number';
//               }
//               return null;
//             },
//           ),
//           ElevatedButton(
//             style: const ButtonStyle(
//               padding: MaterialStatePropertyAll(
//                 EdgeInsets.symmetric(
//                   horizontal: 60,
//                   vertical: 10,
//                 ),
//               ),
//               backgroundColor: MaterialStatePropertyAll(
//                 Color.fromARGB(255, 188, 31, 7),
//               ),
//             ),
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 String name = ''; // get the name value here
//                 String address = ''; // get the address value here
//                 String city = ''; // get the city value here
//                 String state = ''; // get the state value here
//                 String zipCode = ''; // get the zip code value here
//                 String phoneNumber = ''; // get the phone number value here
//                 String cardNumber = ''; // get the card number value here
//                 String expirationDate =
//                     ''; // get the expiration date value here
//                 String cvvNumber = ''; // get the CVV number value here

//                 databaseRef.child('users').push().set({
//                   'email': emailController.text,
//                   'name': name,
//                   'address': address,
//                   'city': city,
//                   'state': state,
//                   'zipCode': zipCode,
//                   'phoneNumber': phoneNumber,
//                   'cardNumber': cardNumber,
//                   'expirationDate': expirationDate,
//                   'cvvNumber': cvvNumber,
//                 });
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Processing Data')),
//                 );
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
