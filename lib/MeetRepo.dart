import 'package:flutter/material.dart';
//import 'package:self_help_group/screen/my_button.dart';
import 'MyTextField.dart';

class MeetingReport extends StatelessWidget {
  const MeetingReport({
    super.key,
  });
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
              const MyTextField(
                labelText: "बैठकीचा दिनांक ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "बैठक क्रमांक ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "वेळ ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "वार ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "बैठकीचे ठिकाण  ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "एकूण सभासद संख्या ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "हजार सदस्यांची संख्या ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "गैरहजर सदस्यांची संख्या",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: 'बैठकीच्या अध्यक्षाचे नाव',
              ),
              const SizedBox(
                height: 40,
              ),
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
              const MyTextField(
                labelText: "प्रेरणा गीत ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "सदस्यांचा परिचय  ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "सदस्यांची हजेरी  ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "मागील बैठकीचा अहवाल वाचून कायम करणे ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "बचत जमा करणे ",
              ),
              // SizedBox(
              //   height: 40,
              // ),
              // Center(
              //   child: Text(
              //     'बचत माहिती',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 24,
              //       color: Color.fromARGB(255, 78, 32, 9),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // MyTextField(
              //   labelText: "सदस्याचे नाव  ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बचत ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "जास्तीची बचत ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "एकूण बचत ",
              // ),
              const SizedBox(height: 40),
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
              const MyTextField(
                labelText: "कर्ज मागणी करणाऱ्या सदस्याचे नाव ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "कर्ज मागणीचे कारण ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "कर्ज मागणी रक्कम रुपये ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "कर्ज मंजूर रुपये रक्कम ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "परतफेडीचे हफ्ते ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "व्याज दर ",
              ),
              // SizedBox(height: 40),
              // Center(
              //   child: Text(
              //     'समूह गुंतवणूक निधी (CIF)',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 24,
              //       color: Color.fromARGB(255, 78, 32, 9),
              //     ),
              //   ),
              // ),
              // Center(
              //   child: Text('ग्रामसंघाद्वारे मंजूर समूह गुंतवणूक निधी (CIF)'),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // MyTextField(
              //   labelText: "एकूण हप्ते ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "एकूण परतफेड केलेले हप्ते रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "मासिक परतफेड मुद्दल रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "व्याज रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "मागील बैठकी अखेर केलेली परतफेड रक्कम रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "मागणीनुसार हफ्त्यांची परतफेड बाकी रुपये ",
              // ),
              // SizedBox(height: 40),
              // Center(
              //   child: Text(
              //     'स्वयंसहाय्यता समूह बँक लिंकेज तपशील',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 24,
              //       color: Color.fromARGB(255, 78, 32, 9),
              //     ),
              //   ),
              // ),
              // Center(
              //   child: Text('बँकेद्वारे मंजूर कर्ज रक्कम रुपये '),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // MyTextField(
              //   labelText: "एकूण हप्ते ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "एकूण परतफेड केलेले हप्ते रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "मासिक परतफेड मुद्दल रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "व्याज रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "मागील बैठकी अखेर केलेली परतफेड रक्कम रुपये ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "मागणीनुसार हफ्त्यांची परतफेड बाकी रुपये ",
              // ),
              // SizedBox(height: 40),
              // Center(
              //   child: Text(
              //     'जमा विवरण',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 24,
              //       color: Color.fromARGB(255, 78, 32, 9),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // MyTextField(
              //   labelText: "मागील शिल्लक (हातात) ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँकेत शिल्लक ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: " सदस्य बचत ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "इतर बचत ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँकेच्या कर्जावरील व्याज ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "संघातील कर्जावरील व्याज",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "अंतर्गत कर्जावरील व्याज ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "दंड  ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँक कर्ज वसुली (मुद्दल) ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "ग्रामसंघ कर्ज वसुली",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "अंतर्गत कर्ज वसुली ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "फिरता निधी (RF)",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँकेकडून प्राप्त निधी (RF)",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँकेकडून प्राप्त कर्ज ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँकेकडून प्राप्त व्याज ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "गटाला इतर जमा रक्कम ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "इतर ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "एकूण जमा ",
              // ),
              // SizedBox(height: 40),
              // Center(
              //   child: Text(
              //     'खर्च विवरण',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 24,
              //       color: Color.fromARGB(255, 78, 32, 9),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // MyTextField(
              //   labelText: "गटांतर्गत कर्ज वाटप ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "ग्रामसंघाच्या कर्जातून कर्ज वाटप ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँक कर्जाच्या सदस्यांना कर्ज वाटप ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "ग्रामसंघातील बचत  ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँक कर्ज परतफेड (मुद्दल) ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "ग्रामसंघ कर्ज परतफेड (मुद्दल)",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "बँकेत दिलेले व्याज ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "ग्रामसंघास दिलेले व्याज ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "मानधन ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "प्रवास खर्च ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "ग्रामसंघाची सभासद फी ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "इतर खर्च ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "अखेर शिल्लक हातात ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "अखेर बँक शिल्लक पासबुक ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "एकूण खर्च ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "पुढील बैठकीचे ठिकाण व अध्यक्ष निश्चित करणे ",
              // ),
              // SizedBox(height: 16),
              // MyTextField(
              //   labelText: "अध्यक्षांच्या परवानगीने ऐन वेळेवर येणारे विषय ",
              // ),
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
              const MyTextField(
                labelText: "प्रशिक्षणार्थीचे नाव ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "प्रशिक्षणाचे नाव ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "ठिकाण ",
              ),
              const SizedBox(height: 16),
              const MyTextField(
                labelText: "कालावधी ",
              ),
              const SizedBox(height: 30),
              // MyButton(
              //   onPressed: (submit) {},
              //   text: 'submit',
              //   textstyle: TextStyle(color: Colors.white),
              // ),
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
