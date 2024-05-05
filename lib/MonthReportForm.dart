import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MonthReportForm extends StatefulWidget {
  const MonthReportForm({super.key});

  @override
  State<MonthReportForm> createState() => _MonthReportFormState();
}

class _MonthReportFormState extends State<MonthReportForm> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _grpName = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _grpFormDate = TextEditingController();
  final TextEditingController _gramSangh = TextEditingController();
  final TextEditingController _prabhagSangh = TextEditingController();
  final TextEditingController _membCount = TextEditingController();
  final TextEditingController _grpBankName = TextEditingController();
  final TextEditingController _bankBranch = TextEditingController();
  final TextEditingController _savAcNo = TextEditingController();
  final TextEditingController _loanAcNo = TextEditingController();

  final TextEditingController _duration = TextEditingController();
  final TextEditingController _presentMembCount = TextEditingController();
  final TextEditingController _totMeetCount = TextEditingController();

  final TextEditingController _currSav = TextEditingController();
  final TextEditingController _loanDistrDate = TextEditingController();
  final TextEditingController _totSav = TextEditingController();
  final TextEditingController _returnEmi = TextEditingController();

  final TextEditingController _penalty = TextEditingController();
  final TextEditingController _bankInterest = TextEditingController();
  final TextEditingController _otherAmt = TextEditingController();
  final TextEditingController _otherExpenses = TextEditingController();
  final TextEditingController _mandhan = TextEditingController();
  final TextEditingController _finalBalanceHand = TextEditingController();
  final TextEditingController _finalBalanceBank = TextEditingController();

  Future<void> monthRepoInFirestore(
    String date,
    String grpName,
    String address,
    String grpFormDate,
    String gramSangh,
    String prabhagSangh,
    String membCount,
    String grpBankName,
    String bankBranch,
    String savAcNo,
    String loanAcNo,
    String duration,
    String presentMembCount,
    String totMeetCount,
    String currSav,
    String loanDistrDate,
    String totSav,
    String returnEmi,
    String penalty,
    String bankInterest,
    String otherAmt,
    String otherExpenses,
    String mandhan,
    String finalBalanceHand,
    String finalBalanceBank,
  ) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('MonthRepo').add(
          {
            'userId': user.uid, // User ID// Use// r name
            'userEmail': user.email ?? '',
            'date': date,
            'grpName': grpName,
            'address': address,
            'grpFormDate': grpFormDate,
            'gramSangh': gramSangh,
            'prabhagSangh': prabhagSangh,
            'membCount': membCount,
            'grpBankName': grpBankName,
            'bankBranch': bankBranch,
            'savAcNo': savAcNo,
            'loanAcNo': loanAcNo,
            'duration': duration,
            'presentMembCount': presentMembCount,
            'totalMeetingCnt': totMeetCount,
            'currSavings': currSav,
            'loanDistrDate': loanDistrDate,
            'totSav': totSav,
            'returnEmi': returnEmi,
            'penalty': penalty,
            'bankInterest': bankInterest,
            'otherAmt': otherAmt,
            'otherExpenses': otherExpenses,
            'manadhan': mandhan,
            'finalBalanceHand': finalBalanceHand,
            'finalBalanceBank': finalBalanceBank,
          },
        );
        Fluttertoast.showToast(
            msg: 'Image and description stored successfully  ');
      } else {
        Fluttertoast.showToast(msg: 'No user signed in.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error storing data in Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'मासिक अहवाल',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Center(
              child: Text(
                'मासिक अहवाल',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _date,
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
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _grpName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text(
                    //'महाराष्ट्र राज्य ग्रामीण जीवनोन्नती अभियान अंतर्गत स्थापन झालेल्या समुहाचे नाव',
                    'समुहाचे नाव',
                  ),
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
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _address,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('पत्ता:'),
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
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _grpFormDate,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('समूह स्थापना दिनांक:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _gramSangh,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('ग्राम संघाचे नाव:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _prabhagSangh,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('प्रभाग संघाचे नाव:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _membCount,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('समूह सदस्य संख्या:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _grpBankName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('समूहाच्या बँकेचे नाव:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _bankBranch,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('बँक शाखा:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _savAcNo,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('बचत खाते क्रमांक:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _loanAcNo,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('कर्ज खाते क्रमांक:'),
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
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'अहवालाचा कालावधी',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _duration,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('दिनांक :-'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _presentMembCount,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('बैठकींना समूह सदस्यांची उपस्थिती:'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _totMeetCount,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('एकूण बैठक संख्या:'),
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
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'कालावधीतील आर्थिक व्यवहार',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _currSav,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('चालू बचत: '),
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
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _loanDistrDate,
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
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _totSav,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('एकूण बचत: रुपये'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _returnEmi,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('एकूण परतफेड केलेले हप्ते रुपये'),
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
              height: 20,
            ),
            const Center(
              child: Text(
                'इतर आर्थिक व्यवहार',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _penalty,
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _bankInterest,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('बँकेकडून प्राप्त व्याज"'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _otherAmt,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('गटाला इतर जमा रक्कम'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _otherExpenses,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('इतर खर्च'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _mandhan,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('मानधन'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _finalBalanceHand,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('अखेर शिल्लक हातात'),
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 119, 118, 118),
                controller: _finalBalanceBank,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('अखेर शिल्लक बँकेत'),
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
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 18,
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 188, 31, 7),
                  ),
                ),
                onPressed: () {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('MonthRepo');
                  collRef.add(
                    {
                      'date': _date.text,
                      'grpName': _grpName.text,
                      'address': _address.text,
                      'grpFormDate': _grpFormDate.text,
                      'gramSangh': _gramSangh.text,
                      'prabhagSangh': _prabhagSangh.text,
                      'membCount': _membCount.text,
                      'grpBankName': _grpBankName.text,
                      'bankBranch': _bankBranch.text,
                      'savAcNo': _savAcNo.text,
                      'loanAcNo': _loanAcNo.text,
                      'duration': _duration.text,
                      'presentMembCount': _presentMembCount.text,
                      'totalMeetingCnt': _totMeetCount.text,
                      'currSavings': _currSav.text,
                      'loanDistrDate': _loanDistrDate.text,
                      'totSav': _totSav.text,
                      'returnEmi': _returnEmi.text,
                      'penalty': _penalty.text,
                      'bankInterest': _bankInterest.text,
                      'otherAmt': _otherAmt.text,
                      'otherExpenses': _otherExpenses.text,
                      'manadhan': _mandhan.text,
                      'finalBalanceHand': _finalBalanceHand.text,
                      'finalBalanceBank': _finalBalanceBank.text,
                    },
                  );
                  _date.clear();
                  _grpName.clear();
                  _address.clear();
                  _grpFormDate.clear();
                  _gramSangh.clear();
                  _prabhagSangh.clear();
                  _membCount.clear();
                  _grpBankName.clear();
                  _bankBranch.clear();
                  _savAcNo.clear();
                  _loanAcNo.clear();
                  _duration.clear();
                  _presentMembCount.clear();
                  _totMeetCount.clear();
                  _currSav.clear();
                  _loanDistrDate.clear();
                  _totSav.clear();
                  _returnEmi.clear();
                  _penalty.clear();
                  _bankInterest.clear();
                  _otherAmt.clear();
                  _otherExpenses.clear();
                  _mandhan.clear();
                  _finalBalanceHand.clear();
                  _finalBalanceBank.clear();
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
