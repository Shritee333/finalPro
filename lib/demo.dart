// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ReadData1 extends StatefulWidget {
//   const ReadData1({Key? key}) : super(key: key);

//   @override
//   State<ReadData1> createState() => _ReadDataState();
// }

// class _ReadDataState extends State<ReadData1> {
//   final TextEditingController memName = TextEditingController();
//   final TextEditingController penalty = TextEditingController();
//   final TextEditingController savings = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             const Center(
//               child: Text(
//                 'Welcome',
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(5),
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 cursorColor: const Color.fromARGB(255, 119, 118, 118),
//                 controller: memName,
//                 decoration: InputDecoration(
//                   border: UnderlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   label: const Text('Member Name'),
//                   labelStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                   ),
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color.fromARGB(255, 226, 34, 20),
//                     ),
//                   ),
//                 ),
//                 onChanged: (value) {},
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: const EdgeInsets.all(5),
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 cursorColor: const Color.fromARGB(255, 119, 118, 118),
//                 controller: savings,
//                 decoration: InputDecoration(
//                   border: UnderlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   label: const Text('Savings'),
//                   labelStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                   ),
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color.fromARGB(255, 226, 34, 20),
//                     ),
//                   ),
//                 ),
//                 onChanged: (value) {},
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: const EdgeInsets.all(5),
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 cursorColor: const Color.fromARGB(255, 119, 118, 118),
//                 controller: penalty,
//                 decoration: InputDecoration(
//                   border: UnderlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   label: const Text('Penalty'),
//                   labelStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                   ),
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color.fromARGB(255, 226, 34, 20),
//                     ),
//                   ),
//                 ),
//                 onChanged: (value) {},
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 CollectionReference collRef =
//                     FirebaseFirestore.instance.collection('memMeet');
//                 collRef.add({
//                   'MemName': memName.text,
//                   'Savings': savings.text,
//                   'Penalty': penalty.text
//                 });
//               },
//               child: const Text('Submit'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('memMeet')
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   List<Row> memMeetWidgets = [];
//                   if (snapshot.hasData) {
//                     final memMeets = snapshot.data?.docs.reversed.toList();
//                     for (var memMeet in memMeets!) {
//                       final memMeetWidget = Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(memMeet['MemName']),
//                           Text(memMeet['Savings']),
//                           Text(memMeet['Penalty']),
//                         ],
//                       );
//                       memMeetWidgets.add(memMeetWidget);
//                     }
//                   }
//                   return Expanded(
//                       child: ListView(
//                     children: memMeetWidgets,
//                   ));
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
