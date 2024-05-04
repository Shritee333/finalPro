import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pro/MyTextFormField.dart';

class MemMeetSavForm extends StatefulWidget {
  const MemMeetSavForm({
    super.key,
  });

  @override
  State<MemMeetSavForm> createState() => _MemMeetSavFormState();
}

class _MemMeetSavFormState extends State<MemMeetSavForm> {
  TextEditingController memName = TextEditingController();
  TextEditingController savingAmt = TextEditingController();
  TextEditingController penalty = TextEditingController();

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
                controller: memName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('Member Name'),
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
                  label: const Text('savings'),
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
                controller: penalty,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('Penalty'),
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
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('MemMeetSaving');
                  collRef.add(
                    {
                      'MemName': memName.text,
                      'SavingAmt': savingAmt.text,
                      'Penalty': penalty.text,
                    },
                  );
                  memName.clear();
                  savingAmt.clear();
                  penalty.clear();
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
