
import 'package:flutter/material.dart';
import 'adminHomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:idol_booking/admin_upload.dart';
// import 'package:idol_booking/admin_customer.dart';

class AdminProfile extends StatelessWidget{
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser;
    final currentUserUid = user?.email;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('admin')
                  .where('email', isEqualTo: currentUserUid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No data found for this user'));
                }

                final userData = snapshot.data!.docs.first.data() as Map<String, dynamic>;

                return SingleChildScrollView(
                    child: Column(
                        children: [

                          Padding(
                              padding: const EdgeInsets.only(top: 30, bottom: 20, left: 8.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text('PROFILE', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,),),
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              enabled:false,
                              decoration: InputDecoration(
                                  label: Text('${userData['name']}', style: TextStyle(color: Colors.black),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  prefixIcon: const Icon(Icons.person)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  enabled: false,
                                  label: Text('${userData['email']}',style: TextStyle(color: Colors.black),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  prefixIcon: const Icon(Icons.email)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  label: Text('${userData['contact']}',style: TextStyle(color: Colors.black),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  prefixIcon: const Icon(Icons.call)
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  label: Text('${userData['address']}',style: TextStyle(color: Colors.black),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  prefixIcon: const Icon(Icons.location_on)
                              ),
                            ),
                          ),
                        ]
                    )
                );
              },
            ),
          ),
          BottomAppBar(
            height: 80,
            color: Colors.white,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  //Navigator.push(context,MaterialPageRoute(builder: (context)=>Admin_Home()));
                },
                  icon: Icon(Icons.home),
                ),

                IconButton(onPressed: (){
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>Customers()));
                },
                  icon: Icon(Icons.people_alt),
                ),
                IconButton(onPressed: (){},
                  icon: Icon(Icons.production_quantity_limits),
                ),
                IconButton(onPressed: (){
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Product()));
                },
                  icon: Icon(Icons.add_a_photo),
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminProfile()));
                },
                  icon: Icon(Icons.account_circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}