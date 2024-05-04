import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final currentUserUid = user?.email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'Profile',
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
                  .collection('memProfile')
                  .where('userEmail', isEqualTo: currentUserUid)
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
                      Container(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 140.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'PROFILE',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
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
                          'Member Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            //labelText: 'Member Name',
                            label: Text(
                              '${userData['memName']}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 76, 76, 76),
                                fontSize: 20,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.person),
                          ),
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
                          'Group Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['grpName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.person),
                          ),
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
                          'Group Entry Date : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            enabled: false,
                            label: Text(
                              '${userData['entryDate']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.email),
                          ),
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
                          'Role : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['role']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.call),
                          ),
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
                          'Group Account Number : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['grpAcNo']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Aadhar Card Number : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(
                              15,
                            ),
                            label: Text(
                              '${userData['aadharCard']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Contact Number : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 76, 76, 76),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['phnNo']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Father/ Husband Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['husbName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Email ID : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['email']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Date Of Birth : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              label: Text(
                                '${userData['dob']}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 76, 76, 76)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: const Icon(Icons.location_on)),
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
                          'Age : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['age']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Education : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['education']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Marital Status : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['maritalStatus']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Annual Income : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['annualIncome']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Main Occupation: ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['mainOccupation']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Sub Occupation : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['subOccupation']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'caste : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['caste']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'religion : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['religion']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Member Social Status : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['memSocioStatus']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Heir Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['heirName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Heir Age : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['heirAge']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Heir Relation with member : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['heirRelation']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Member Address: ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['memAddress']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'House Number : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['houseNo']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Settlement Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['settlementName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Village Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['villageName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'Taluka Name: ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['talukaName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'State Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['stateName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //prefixIcon: const Icon(Icons.location_on),
                          ),
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
                          'District Name : ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: Text(
                              '${userData['distName']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                            // prefixIcon: const Icon(Icons.location_on),
                          ),
                        ),
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
