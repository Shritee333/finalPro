import 'package:flutter/material.dart';
import 'MyTextField.dart';

class GrpInfoForm extends StatelessWidget {
  const GrpInfoForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'कर्ज वितरण',
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
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'अंतर्गत कर्ज',
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
                  //controller: loanDistrDate,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('कर्ज वाटप रक्कम: '),
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
                  //   controller: loanDistrDate,
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
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  cursorColor: const Color.fromARGB(255, 119, 118, 118),
                  //controller: loanDistrDate,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('मुद्दल परतफेड'),
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
                  //controller: loanDistrDate,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('व्याज परतफेड'),
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
                  //controller: loanDistrDate,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text('शिल्लक कर्ज रक्कम'),
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
              const Center(
                child: Text(
                  'O.S.F. कर्ज',
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
              const Center(
                child: Text('कर्ज वाटप रक्कम:   रुपये'),
              ),
              const SizedBox(
                height: 16,
              ),
              const MyTextField(
                labelText: "मुद्दल परतफेड: रुपये ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "व्याज परतफेड: रुपये",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "शिल्लक कर्ज रक्कम: रुपये",
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'C.I.F. कर्ज',
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
              const Center(
                child: Text('कर्ज वाटप रक्कम:   रुपये'),
              ),
              const SizedBox(
                height: 16,
              ),
              const MyTextField(
                labelText: "मुद्दल परतफेड: रुपये ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "व्याज परतफेड: रुपये",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "शिल्लक कर्ज रक्कम: रुपये",
              ),
              const Center(
                child: Text(
                  'V.R.F. कर्ज',
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
              const Center(
                child: Text('कर्ज वाटप रक्कम:   रुपये'),
              ),
              const SizedBox(
                height: 16,
              ),
              const MyTextField(
                labelText: "मुद्दल परतफेड: रुपये ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "व्याज परतफेड: रुपये",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "शिल्लक कर्ज रक्कम: रुपये",
              ),
              const Center(
                child: Text(
                  'P.M.F.M.E. कर्ज',
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
              const Center(
                child: Text('कर्ज वाटप रक्कम:   रुपये'),
              ),
              const SizedBox(
                height: 16,
              ),
              const MyTextField(
                labelText: "मुद्दल परतफेड: रुपये ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "व्याज परतफेड: रुपये",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "शिल्लक कर्ज रक्कम: रुपये",
              ),
              const Center(
                child: Text(
                  'बँक कर्ज',
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
              const Center(
                child: Text('कर्ज वाटप रक्कम:   रुपये'),
              ),
              const SizedBox(
                height: 16,
              ),
              const MyTextField(
                labelText: "मुद्दल परतफेड: रुपये ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "व्याज परतफेड: रुपये",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "शिल्लक कर्ज रक्कम: रुपये",
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
                  onPressed: () {},
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
