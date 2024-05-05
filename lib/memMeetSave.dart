// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ReadData extends StatefulWidget {
//   const ReadData({Key? key}) : super(key: key);
//
//   @override
//   State<ReadData> createState() => _ReadDataState();
// }
//
// class _ReadDataState extends State<ReadData> {
//   final TextEditingController memName = TextEditingController();
//   final TextEditingController penalty = TextEditingController();
//   final TextEditingController savings = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final user= FirebaseAuth.instance.currentUser;
//     final userId =user?.email;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 188, 31, 7),
//
//         title: const Text(
//           'उमेद स्वयंसहाय्यता समूह',
//           style: TextStyle(
//             fontWeight: FontWeight.w200,
//             color: Color.fromARGB(255, 255, 255, 255),
//             fontSize: 18,
//           ),
//         ),
//         // actions: const [Icon(Icons.search),],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
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
//                   label: const Text('सदस्याचे नाव'),
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
//                   label: const Text('बचत'),
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
//                   label: const Text('दंड'),
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
//               style: const ButtonStyle(
//                 padding: MaterialStatePropertyAll(
//                   EdgeInsets.symmetric(
//                     horizontal: 60,
//                     vertical: 10,
//                   ),
//                 ),
//                 backgroundColor: MaterialStatePropertyAll(
//                   Color.fromARGB(255, 188, 31, 7),
//                 ),
//               ),
//               onPressed: () {
//                 CollectionReference collRef =
//                     FirebaseFirestore.instance.collection('memMeet');
//                 collRef.add({
//                   'MemName': memName.text,
//                   'Savings': savings.text,
//                   'Penalty': penalty.text
//                 });
//                 memName.clear();
//                 savings.clear();
//                 penalty.clear();
//               },
//               child: const Text('सबमिट'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             // Container(
//             //   margin: const EdgeInsets.all(25),
//             //   child: Center(
//             //     child: StreamBuilder<QuerySnapshot>(
//             //         stream: FirebaseFirestore.instance
//             //             .collection('memMeet')
//             //             .snapshots(),
//             //         builder: (context, snapshot) {
//             //           List<Row> memMeetWidgets = [];
//             //           if (snapshot.hasData) {
//             //             final memMeets = snapshot.data?.docs.reversed.toList();
//             //             for (var memMeet in memMeets!) {
//             //               final memMeetWidget = Row(
//             //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                 mainAxisSize: MainAxisSize.max,
//             //                 children: [
//             //                   Text(memMeet['MemName']),
//             //                   Text(memMeet['Savings']),
//             //                   Text(memMeet['Penalty']),
//             //                 ],
//             //               );
//             //               memMeetWidgets.add(memMeetWidget);
//             //             }
//             //           }
//             //
//             //           return Expanded(
//             //             child: (Column(
//             //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               crossAxisAlignment: CrossAxisAlignment.end,
//             //               children: memMeetWidgets,
//             //             )
//             //
//             //                 //children: memMeetWidgets,
//             //                 ),
//             //           );
//             //         },),
//             //   ),
//             // )
//
//             Container(
//               margin: const EdgeInsets.all(25),
//               child: Center(
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('personalPass').where('email', isEqualTo:userId)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     List<Row> memMeetWidgets = [];
//                     if (snapshot.hasData) {
//                       final memMeets = snapshot.data?.docs.reversed.toList();
//                       for (var memMeet in memMeets!) {
//                         final memMeetWidget = Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Text(memMeet['EmiAmt'].toString()),
//                             Text(memMeet['date'].toString()),
//                             //Text(memMeet['email']),
//                           ],
//                         );
//                         memMeetWidgets.add(memMeetWidget);
//                       }
//                     }
//
//                     return Expanded(
//                       child: (Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: memMeetWidgets,
//                       )
//
//                           //children: memMeetWidgets,
//                       ),
//                     );
//                   },),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  final TextEditingController memName = TextEditingController();
  final TextEditingController penalty = TextEditingController();
  final TextEditingController savings = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'सभासद बचत नोंदवही',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: memName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('सदस्याचे नाव'),
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: savings,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('बचत'),
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: penalty,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('दंड'),
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
            const SizedBox(height: 10),
            // ElevatedButton(
            //   style: ButtonStyle(
            //     padding: MaterialStateProperty.all(
            //       const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            //     ),
            //     backgroundColor: MaterialStateProperty.all(
            //       const Color.fromARGB(255, 188, 31, 7),
            //     ),
            //   ),
            //   onPressed: () {
            //     CollectionReference collRef =
            //     FirebaseFirestore.instance.collection('memMeet');
            //     collRef.add({
            //       'MemName': memName.text,
            //       'Savings': savings.text,
            //       'Penalty': penalty.text,
            //     });
            //     memName.clear();
            //     savings.clear();
            //     penalty.clear();
            //   },
            //   child: const Text('सबमिट'),
            // ),
            // const SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(25),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('personalPass')
                      .where('email', isEqualTo: userId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('No data found for this user'),
                      );
                    }

                    List<Widget> memMeetWidgets = [];
                    final memMeets = snapshot.data!.docs.reversed.toList();
                    for (var memMeet in memMeets) {
                      final memMeetWidget = Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(memMeet['EmiAmt'].toString()),
                          Text(memMeet['date'].toString()),
                          Text(memMeet['email'].toString()),
                        ],
                      );
                      memMeetWidgets.add(memMeetWidget);
                    }

                    return ListView(
                      children: memMeetWidgets,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
