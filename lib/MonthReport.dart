// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'MyTextField.dart';

// class MonthReport extends StatefulWidget {
//   const MonthReport({super.key});

//   @override
//   State<MonthReport> createState() => _MonthReportState();
// }

// class _MonthReportState extends State<MonthReport> {
// final TextEditingController _date = TextEditingController();
// final TextEditingController _grpName = TextEditingController();
// final TextEditingController _address = TextEditingController();
// final TextEditingController _grpFormDate = TextEditingController();
// final TextEditingController _gramSangh = TextEditingController();
// final TextEditingController _prabhagSangh = TextEditingController();
// final TextEditingController _membCount = TextEditingController();
// final TextEditingController _grpBankName = TextEditingController();
// final TextEditingController _bankBranch = TextEditingController();
// final TextEditingController _savAcNo = TextEditingController();
// final TextEditingController _loanAcNo = TextEditingController();

// final TextEditingController _duration = TextEditingController();
// final TextEditingController _presentMembCount = TextEditingController();
// final TextEditingController _totMeetCount = TextEditingController();

// final TextEditingController _currSav = TextEditingController();
// final TextEditingController _loanDistrDate = TextEditingController();
// final TextEditingController _totSav = TextEditingController();
// final TextEditingController _returnEmi = TextEditingController();

// final TextEditingController _penalty = TextEditingController();
// final TextEditingController _bankInterest = TextEditingController();
// final TextEditingController _otherAmt = TextEditingController();
// final TextEditingController _otherExpenses = TextEditingController();
// final TextEditingController _mandhan = TextEditingController();
// final TextEditingController _finalBalanceHand = TextEditingController();
// final TextEditingController _finalBalanceBank = TextEditingController();

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: const Color.fromARGB(255, 188, 31, 7),
//       title: const Text(
//         'मासिक अहवाल',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Color.fromARGB(255, 255, 255, 255),
//         ),
//       ),
//     ),
//     body: SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('monthReport')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return const Center(
//                     child: Text('No data found for this user'),
//                   );
//                 }
//               }
//                 final userData =
//                     snapshot.data!.docs.first.data() as Map<String, dynamic>;

// const SizedBox(
//   height: 16,
// ),
// const Center(
//   child: Text(
//     'मासिक अहवाल',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: " :",
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText:
//       "महाराष्ट्र राज्य ग्रामीण जीवनोन्नती अभियान अंतर्गत स्थापन झालेल्या समुहाचे नाव",
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "पत्ता:",
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const Center(
//   child: Text(
//     'अहवालाचा कालावधी',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "   /   /202    ते /   /202   ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: " ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "",
// ),
// const SizedBox(height: 16),
// const Center(
//   child: Text(
//     'कालावधीतील आर्थिक व्यवहार',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 5,
// ),
// const Center(
//   child: Text('चालू बचत:   रुपये'),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "एकूण बचत: रुपये",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "एकूण परतफेड केलेले हप्ते रुपये ",
// ),
// const SizedBox(height: 16),
// const Center(
//   child: Text(
//     'अंतर्गत कर्ज',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 5,
// ),
// const Center(
//   child: Text('कर्ज वाटप रक्कम:   रुपये'),
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "मुद्दल परतफेड: रुपये ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "व्याज परतफेड: रुपये",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "शिल्लक कर्ज रक्कम: रुपये",
// ),
// const SizedBox(height: 50),
// const Center(
//   child: Text(
//     'O.S.F. कर्ज',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 5,
// ),
// const Center(
//   child: Text('कर्ज वाटप रक्कम:   रुपये'),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "मुद्दल परतफेड: रुपये ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "व्याज परतफेड: रुपये",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "शिल्लक कर्ज रक्कम: रुपये",
// ),
// const SizedBox(height: 50),
// const Center(
//   child: Text(
//     'C.I.F. कर्ज',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 5,
// ),
// const Center(
//   child: Text('कर्ज वाटप रक्कम:   रुपये'),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "मुद्दल परतफेड: रुपये ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "व्याज परतफेड: रुपये",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "शिल्लक कर्ज रक्कम: रुपये",
// ),
// const Center(
//   child: Text(
//     'V.R.F. कर्ज',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 5,
// ),
// const Center(
//   child: Text('कर्ज वाटप रक्कम:   रुपये'),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "मुद्दल परतफेड: रुपये ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "व्याज परतफेड: रुपये",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "शिल्लक कर्ज रक्कम: रुपये",
// ),
// const Center(
//   child: Text(
//     'P.M.F.M.E. कर्ज',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 5,
// ),
// const Center(
//   child: Text('कर्ज वाटप रक्कम:   रुपये'),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "मुद्दल परतफेड: रुपये ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "व्याज परतफेड: रुपये",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "शिल्लक कर्ज रक्कम: रुपये",
// ),
// const Center(
//   child: Text(
//     'बँक कर्ज',
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Color.fromARGB(255, 78, 32, 9),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 5,
// ),
// const Center(
//   child: Text('कर्ज वाटप रक्कम:   रुपये'),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "मुद्दल परतफेड: रुपये ",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "व्याज परतफेड: रुपये",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "शिल्लक कर्ज रक्कम: रुपये",
// ),
// const Text(
//   'इतर आर्थिक व्यवहार',
//   style: TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 24,
//     color: Color.fromARGB(255, 78, 32, 9),
//   ),
// ),
// const SizedBox(
//   height: 16,
// ),
// const MyTextField(
//   labelText: "दंड",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "बँकेकडून प्राप्त व्याज",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "गटाला इतर जमा रक्कम ",
// ),
// const SizedBox(height: 16),
// const MyTextField(labelText: "इतर खर्च"),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "मानधन",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "अखेर शिल्लक हातात",
// ),
// const SizedBox(height: 16),
// const MyTextField(
//   labelText: "अखेर शिल्लक बँकेत",
// ),
// const SizedBox(height: 50),
// Center(
//   child: ElevatedButton(
//     style: const ButtonStyle(
//       padding: MaterialStatePropertyAll(
//         EdgeInsets.symmetric(
//           horizontal: 50,
//           vertical: 18,
//         ),
//       ),
//       backgroundColor: MaterialStatePropertyAll(
//         Color.fromARGB(255, 188, 31, 7),
//       ),
//     ),
//     onPressed: () {},
//     child: const Text(
//       'Submit',
//       style: TextStyle(
//         fontSize: 17,
//       ),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 20,
// ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MonthReport extends StatelessWidget {
  const MonthReport({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    // final currentUserUid = user?.email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'मासिक अहवाल',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Column(
        children: [
          /*  */
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('MonthRepo')
                  //.where('userEmail', isEqualTo: currentUserUid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No data found for this user',
                    ),
                  );
                }

                final userData =
                    snapshot.data!.docs.first.data() as Map<String, dynamic>;

                // return ListView(
                //   children: [
                //     ListTile(
                //       title: Text('Name: ${userData['name']}'),
                //       subtitle: Text('Email: ${userData['email']}'),
                //     ),
                //     // Add more ListTile widgets for other user data fields as needed
                //   ],
                // );
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 100.0,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'मासिक अहवाल',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'दिनांक : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['date']}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 76, 76, 76),
                            fontSize: 23,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'महाराष्ट्र राज्य ग्रामीण जीवनोन्नती अभियान अंतर्गत स्थापन झालेल्या समुहाचे नाव : ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['grpName']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'पत्ता : ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['address']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'समूह स्थापना दिनांक: : ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['grpFormDate']}',
                          style: const TextStyle(
                              fontSize: 23,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'ग्राम संघाचे नाव: : ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['gramSangh']}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'प्रभाग संघाचे नाव: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['prabhagSangh']}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'समूह सदस्य संख्या: ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 76, 76, 76),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['membCount']}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'समूहाच्या बँकेचे नाव: ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['grpBankName']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'बँक शाखा: ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['bankBranch']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'बचत खाते क्रमांक: ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['savAcNo']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'कर्ज खाते क्रमांक:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['loanAcNo']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          'अहवालाचा कालावधी',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'दिनांक :- ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['duration']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'बैठकींना समूह सदस्यांची उपस्थिती:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['presentMembCount']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'एकूण बैठक संख्या:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['totMeetCount']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          'कालावधीतील आर्थिक व्यवहार',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'चालू बचत:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['currSav']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'कर्ज वाटप रक्कम:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['loanDistrDate']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'एकूण बचत: ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['totSav']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'एकूण परतफेड केलेले हप्ते रुपये:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['returnEmi']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          'इतर आर्थिक व्यवहार',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'दंड:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['penalty']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'बँकेकडून प्राप्त व्याज:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['bankInterest']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'गटाला इतर जमा रक्कम:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['otherAmt']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'इतर खर्च :',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['otherExpenses']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'मानधन:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['mandhan']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'अखेर शिल्लक हातात',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['finalBalanceHand']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'अखेर शिल्लक बँकेत:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${userData['finalBalanceBank']}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 76, 76)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
