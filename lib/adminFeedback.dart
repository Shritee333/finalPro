import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'User Feedback',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
          ),
        ),
        // actions: const [Icon(Icons.search),],
      ),
      body: const UserFeedbackList(),
    );
  }
}

class UserFeedbackList extends StatelessWidget {
  const UserFeedbackList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No feedback available'));
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var feedbackData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
            final String feedback = feedbackData['feedback'] ?? '';
            final String user = feedbackData['email'] ?? '';
            final String timestamp = _formatTimestamp(feedbackData['timestamp']);
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(feedback),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('User: $user'),
                    const SizedBox(height: 4),
                    Text('Timestamp: $timestamp'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    String formattedTime = '${dateTime.hour}:${dateTime.minute}';
    return '$formattedDate $formattedTime';
  }
}