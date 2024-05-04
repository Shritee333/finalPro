import 'package:flutter/material.dart';
import 'MyTextField.dart';

class MemSav extends StatelessWidget {
  const MemSav({
    super.key,
  });

  // final TextEditingController date = TextEditingController();
  // final TextEditingController actMonth = TextEditingController();
  // final TextEditingController totalMeet = TextEditingController();
  // final TextEditingController balance = TextEditingController();
  // final TextEditingController bank = TextEditingController();
  // final TextEditingController loanAmt = TextEditingController();
  // final TextEditingController name = TextEditingController();
  // final TextEditingController loAppAmt = TextEditingController();
  // final TextEditingController loanLeason = TextEditingController();
  // final TextEditingController loanRepayDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'सभासद बचत नोंदवही',
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
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'बचत माहिती',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const MyTextField(
              labelText: "सदस्याचे नाव  ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बचत ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "जास्तीची बचत ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "एकूण बचत ",
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'समूह गुंतवणूक निधी (CIF)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 78, 32, 9),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text('ग्रामसंघाद्वारे मंजूर समूह गुंतवणूक निधी (CIF)'),
            ),
            const SizedBox(
              height: 16,
            ),
            const MyTextField(
              labelText: "एकूण हप्ते ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "एकूण परतफेड केलेले हप्ते रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "मासिक परतफेड मुद्दल रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "व्याज रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "मागील बैठकी अखेर केलेली परतफेड रक्कम रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "मागणीनुसार हफ्त्यांची परतफेड बाकी रुपये ",
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'स्वयंसहाय्यता समूह बँक लिंकेज तपशील',
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
              child: Text('बँकेद्वारे मंजूर कर्ज रक्कम रुपये '),
            ),
            const SizedBox(
              height: 16,
            ),
            const MyTextField(
              labelText: "एकूण हप्ते ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "एकूण परतफेड केलेले हप्ते रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "मासिक परतफेड मुद्दल रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "व्याज रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "मागील बैठकी अखेर केलेली परतफेड रक्कम रुपये ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "मागणीनुसार हफ्त्यांची परतफेड बाकी रुपये ",
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'जमा विवरण',
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
            const MyTextField(
              labelText: "मागील शिल्लक (हातात) ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँकेत शिल्लक ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: " सदस्य बचत ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "इतर बचत ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँकेच्या कर्जावरील व्याज ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "संघातील कर्जावरील व्याज",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "अंतर्गत कर्जावरील व्याज ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "दंड  ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँक कर्ज वसुली (मुद्दल) ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "ग्रामसंघ कर्ज वसुली",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "अंतर्गत कर्ज वसुली ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "फिरता निधी (RF)",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँकेकडून प्राप्त निधी (RF)",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँकेकडून प्राप्त कर्ज ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँकेकडून प्राप्त व्याज ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "गटाला इतर जमा रक्कम ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "इतर ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "एकूण जमा ",
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'खर्च विवरण',
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
            const MyTextField(
              labelText: "गटांतर्गत कर्ज वाटप ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "ग्रामसंघाच्या कर्जातून कर्ज वाटप ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँक कर्जाच्या सदस्यांना कर्ज वाटप ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "ग्रामसंघातील बचत  ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँक कर्ज परतफेड (मुद्दल) ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "ग्रामसंघ कर्ज परतफेड (मुद्दल)",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "बँकेत दिलेले व्याज ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "ग्रामसंघास दिलेले व्याज ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "मानधन ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "प्रवास खर्च ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "ग्रामसंघाची सभासद फी ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "इतर खर्च ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "अखेर शिल्लक हातात ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "अखेर बँक शिल्लक पासबुक ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "एकूण खर्च ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "पुढील बैठकीचे ठिकाण व अध्यक्ष निश्चित करणे ",
            ),
            const SizedBox(height: 16),
            const MyTextField(
              labelText: "अध्यक्षांच्या परवानगीने ऐन वेळेवर येणारे विषय ",
            ),
            const SizedBox(height: 32),
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
                onPressed: () {},
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
