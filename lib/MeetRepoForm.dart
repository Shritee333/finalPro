import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MeetingReportForm extends StatefulWidget {
  const MeetingReportForm({
    super.key,
  });

  @override
  State<MeetingReportForm> createState() => _MeetingReportFormState();
}

class _MeetingReportFormState extends State<MeetingReportForm> {
  TextEditingController meetDate = TextEditingController();
  TextEditingController meetNO = TextEditingController();
  TextEditingController meetTime = TextEditingController();
  TextEditingController meetDay = TextEditingController();
  TextEditingController meetPlace = TextEditingController();
  TextEditingController totalMember = TextEditingController();
  TextEditingController presentMember = TextEditingController();
  TextEditingController absentMember = TextEditingController();
  TextEditingController meetHead = TextEditingController();

  TextEditingController motivSong = TextEditingController();
  TextEditingController memIntro = TextEditingController();
  TextEditingController memPresenty = TextEditingController();
  TextEditingController lastMeetReport = TextEditingController();
  TextEditingController collectSavings = TextEditingController();

  TextEditingController loanReqName = TextEditingController();
  TextEditingController loanReason = TextEditingController();
  TextEditingController loanAmt = TextEditingController();
  TextEditingController loanSanctionedAmt = TextEditingController();
  TextEditingController emi = TextEditingController();
  TextEditingController interestRate = TextEditingController();

  TextEditingController trainingNm = TextEditingController();
  TextEditingController traineeNm = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController duration = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'बैठक अहवाल नोंदवही',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'बैठक अहवाल',
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
                  controller: meetDate,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('बैठकीचा दिनांक'),
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
                  controller: meetNO,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('बैठक क्रमांक'),
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
                  controller: meetTime,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('वेळ'),
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
                  controller: meetDay,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('वार'),
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
                  controller: meetPlace,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('बैठकीचे ठिकाण'),
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
                  controller: totalMember,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('एकूण सभासद संख्या'),
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
                  controller: presentMember,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('हजर सदस्यांची संख्या'),
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
                  controller: absentMember,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('गैरहजर सदस्यांची संख्या'),
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
                  controller: meetHead,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('बैठकीच्या अध्यक्षाचे नाव'),
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
              const SizedBox(height: 16,),
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
                        FirebaseFirestore.instance.collection('MeetReport');
                    collRef.add({
                      'MeetDate': meetDate.text,
                      'MeetDay': meetDay.text,
                      'MeetHead': meetHead.text,
                      'MeetNO': meetNO.text,
                      'MeetPlace': meetPlace.text,
                      'MeetTime': meetTime.text,
                      'PresentMember': presentMember.text,
                      'AbsentMember': absentMember.text,
                      'TotalMember': totalMember.text,
                    });
                    meetDate.clear();
                    meetDay.clear();
                    meetHead.clear();
                    meetNO.clear();
                    meetPlace.clear();
                    meetTime.clear();
                    totalMember.clear();
                    presentMember.clear();
                    absentMember.clear();
                  },
                  child: const Text(
                    'सबमिट',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'विषय सूची',
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
                  controller: motivSong,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('प्रेरणा गीत'),
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
                  controller: memIntro,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('सदस्यांचा परिचय'),
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
                  controller: memPresenty,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('सदस्यांची हजेरी'),
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
                  controller: lastMeetReport,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('मागील बैठकीचा अहवाल वाचून कायम करणे '),
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
                  controller: collectSavings,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('बचत जमा करणे'),
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
                        FirebaseFirestore.instance.collection('SubjectList');
                    collRef.add({
                      'MotivSong': motivSong.text,
                      'MemIntro': memIntro.text,
                      'MemPresenty': memPresenty.text,
                      'LastMeetReport': lastMeetReport.text,
                      'CollectSavings': collectSavings.text,
                    });
                    motivSong.clear();
                    memIntro.clear();
                    memPresenty.clear();
                    lastMeetReport.clear();
                    collectSavings.clear();
                  },
                  child: const Text(
                    'सबमिट',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              const Center(
                child: Text(
                  'नवीन कर्ज प्रकरणे',
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
                  controller: loanReqName,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('कर्ज मागणी करणाऱ्या सदस्याचे नाव '),
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
                  controller: loanReason,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('कर्ज मागणीचे कारण '),
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
                  controller: loanAmt,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('कर्ज मागणी रक्कम रुपये'),
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
                  controller: loanSanctionedAmt,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('कर्ज मंजूर रुपये रक्कम'),
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
                  controller: emi,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('परतफेडीचे हफ्ते'),
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
                  controller: interestRate,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('व्याज दर'),
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
                        FirebaseFirestore.instance.collection('NewLoanCases');
                    collRef.add({
                      'LoanReqName': loanReqName.text,
                      'LoanReason': loanReason.text,
                      'LoanAmt': loanAmt.text,
                      'LoanSanctionedAmt': loanSanctionedAmt.text,
                      'Emi': emi.text,
                      'InterestRate': interestRate.text,
                    });
                    loanReqName.clear();
                    loanReason.clear();
                    loanAmt.clear();
                    loanSanctionedAmt.clear();
                    emi.clear();
                    interestRate.clear();
                  },
                  child: const Text(
                    'सबमिट',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'गटातील प्रशिक्षणांबाबतचा तपशील',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
                  controller: traineeNm,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('प्रशिक्षणार्थीचे नाव'),
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
                  controller: trainingNm,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('प्रशिक्षणाचे नाव'),
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
                  controller: place,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('ठिकाण'),
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
                  controller: duration,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('कालावधी'),
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
              const SizedBox(height: 30),
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
                        FirebaseFirestore.instance.collection('GrpTraining');
                    collRef.add({
                      'TraineeName': traineeNm.text,
                      'TrainingName': trainingNm.text,
                      'Place': place.text,
                      'Duration': duration.text,
                    });
                    traineeNm.clear();
                    trainingNm.clear();
                    place.clear();
                    duration.clear();
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
            ],
          ),
        ),
      ),
    );
  }
}
