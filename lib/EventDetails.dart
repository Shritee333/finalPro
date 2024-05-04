import 'package:flutter/material.dart';

class CutomizeOrderReq_DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> requestData;

  const CutomizeOrderReq_DetailsScreen({super.key, required this.requestData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(
                'User ID', requestData['userId'] ?? 'Name not available'),
            const SizedBox(height: 10),
            _buildDetailRow('grpName',
                requestData['grpName'] ?? 'Description not available'),
            const SizedBox(height: 10),
            _buildDetailRow('actName',
                requestData['actName'] ?? 'Description not available'),
            const SizedBox(height: 10),
            _buildDetailRow('Email',
                requestData['userEmail'] ?? 'Description not available'),
            const SizedBox(height: 10),
            _buildDetailRow('Address',
                requestData['address'] ?? 'Description not available'),
            const SizedBox(height: 10),
            _buildDetailRow(
                'date', requestData['date'] ?? 'Description not available'),
            const SizedBox(height: 10),
            _buildDetailRow('Description',
                requestData['description'] ?? 'Description not available'),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueGrey), // Added border decoration
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200, // Adjust the height as needed
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      requestData['imageUrl'] ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
