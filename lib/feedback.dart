//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class FeedBackPage extends StatelessWidget {
//   const FeedBackPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 188, 31, 7),
//         title: const Text(
//           'Feedback',
//           style: TextStyle(
//             fontWeight: FontWeight.w200,
//             color: Color.fromARGB(255, 255, 255, 255),
//             fontSize: 18,
//           ),
//         ),
//         // actions: const [Icon(Icons.search),],
//       ),
//       body: Center(
//         child: ElevatedButton(
//           style: const ButtonStyle(
//             backgroundColor:MaterialStatePropertyAll(
//               Color.fromARGB(255, 188, 31, 7),),
//           ),
//           onPressed: () {
//             showDialog(
//                 context: context, builder: (context) => const FeedbackDialog());
//           }, child:const Text('Open Form'),
//         ),
//       ),
//     );
//   }
// }
//
// class FeedbackDialog extends StatefulWidget {
//   const FeedbackDialog({Key? key}) : super(key: key);
//
//   @override
//   State<FeedbackDialog> createState() => _FeedbackDialogState();
// }
//
// class _FeedbackDialogState extends State<FeedbackDialog> {
//   final TextEditingController _controller = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Form(
//         key: _formKey,
//         child: TextFormField(
//
//           controller: _controller,
//           keyboardType: TextInputType.multiline,
//           cursorColor: Colors.black,
//           decoration: const InputDecoration(
//             focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color: Colors.black)),
//
//             hintText: 'Enter your feedback here',
//             filled: true,
//           ),
//           maxLines: 5,
//           maxLength: 4096,
//           textInputAction: TextInputAction.done,
//           validator: (String? text) {
//             if (text == null || text.isEmpty) {
//               return 'Please enter a value';
//             }
//             return null;
//           },
//         ),
//       ),
//       actions: [
//         TextButton(
//           child: const Text('Cancel',style: TextStyle(color: Colors.black),),
//           onPressed: () => Navigator.pop(context),
//         ),
//         TextButton(
//           child: const Text('Send',style: TextStyle(color: Colors.black),),
//           onPressed: () async {
//             // Only if the input form is valid (the user has entered text)
//             if (_formKey.currentState!.validate()) {
//               // We will use this var to show the result
//               // of this operation to the user
//               String message;
//
//               try {
//                 // Get a reference to the `feedback` collection
//                 final collection =
//                 FirebaseFirestore.instance.collection('feedback');
//
//                 // Write the server's timestamp and the user's feedback
//                 await collection.doc().set({
//                   'timestamp': FieldValue.serverTimestamp(),
//                   'feedback': _controller.text,
//                 });
//
//                 message = 'Feedback sent successfully';
//               } catch (e) {
//                 message = 'Error when sending feedback';
//               }
//
//               // Show a snackbar with the result
//               ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: Text(message)));
//               Navigator.pop(context);
//             }
//           },
//         )
//       ],
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBackPage extends StatelessWidget {
  FeedBackPage({Key? key}) : super(key: key);

  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'Feedback',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
          ),
        ),
        // actions: const [Icon(Icons.search),],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Feedback',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
            child: Container(
              child: TextField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter Your Feedback',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: 275,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:const Color.fromARGB(255, 188, 31, 7),
              ),
              child: TextButton(

                onPressed: () {
                  String feedback = _feedbackController.text;
                  _submitFeedback(context, feedback); // Pass context here
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitFeedback(BuildContext context, String feedback) {
    User? user= FirebaseAuth.instance.currentUser;
    CollectionReference feedbackCollection = FirebaseFirestore.instance.collection('feedback');
    feedbackCollection.add({
      'email':user?.email,
      'UserId':user?.uid,
      'feedback': feedback,
      'timestamp': DateTime.now(),
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Feedback submitted successfully!'),
        duration: Duration(seconds: 2),
      ));
      _feedbackController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to submit feedback: $error'),
        duration: Duration(seconds: 2),
      ));
    });
  }
}