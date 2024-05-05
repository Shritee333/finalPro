import 'package:final_pro/Event.dart';
import 'package:final_pro/EventDetails.dart';
import 'package:final_pro/MeetDetailsForm.dart';
import 'package:final_pro/MemPerPass.dart';
import 'package:final_pro/MemSav.dart';
import 'package:final_pro/MonthReport.dart';
import 'package:final_pro/depositExpenses.dart';
import 'package:final_pro/memMeetSave.dart';
import 'package:final_pro/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ActivityInfoForm.dart';
import 'MeetRepoForm.dart';
import 'feedback.dart';
import 'loginScreen.dart';

class OptionBox extends StatefulWidget {
  //final IconData icon;
  final String name;
  final Function() onTap;

  const OptionBox({
    Key? key,
    // required this.icon,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  State<OptionBox> createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(
            //   widget.icon,
            //   size: 40,
            //   color: const Color.fromARGB(255, 183, 62, 62),
            // ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),

        title: const Text(
          'उमेद स्वयंसहाय्यता समूह',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
          ),
        ),
        // actions: const [Icon(Icons.search),],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 190, 83, 50),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg.jpg',
                    ),
                    fit: BoxFit.fill),
              ),
              accountName: Text(
                'Shraddha Kambli',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text('shraddhak11@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sgk.jpeg'),
              ),
            ),
            ListTile(
              title: const Text('My Profile'),
              leading: const Icon(
                Icons.person,
                color: Color.fromARGB(200, 17, 17, 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Profile(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Files'),
              leading: const Icon(
                Icons.folder,
                color: Color.fromARGB(200, 17, 17, 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const DepositExpFile(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Feedback'),
              leading: const Icon(
                Icons.feedback,
                color: Color.fromARGB(200, 17, 17, 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => FeedBackPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              leading: const Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(200, 17, 17, 17),
              ),
              onTap: () {
                _signOut(context);
              },
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/indian-women.png',
            height: 270,
            width: 270,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 0,
              ),
              children: [
                // OptionBox(
                //   //icon: Icons.person,
                //   name: 'बचत गट तपशील',
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const MemSav(),
                //         //     builder: (context) => const GrpInfo(),
                //       ),
                //     );
                //   },
                // ),
                OptionBox(
                  // icon: Icons.person,
                  name: 'सदस्याचे वैयक्तिक पासबुक',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MemPerPass(),
                      ),
                    );
                  },
                ),
                OptionBox(
                  name: 'बैठक अहवाल नोंदवही',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const MeetingReportForm(),
                      ),
                    );
                  },
                ),
                OptionBox(
                  name: 'सभासद बचत नोंदवही',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReadData(),
                      ),
                    );
                  },
                ),
                OptionBox(
                  name: 'सभासद बचत नोंदवही',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MemPerPass(),
                      ),
                    );
                  },
                ),
                OptionBox(
                  // icon: Icons.settings,
                  name: 'बचत माहिती',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MeetDetailsForm(),
                      ),
                    );
                  },
                ),
                OptionBox(
                  // icon: Icons.settings,
                  name: 'मासिक अहवाल',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MonthReport(),
                      ),
                    );
                  },
                ),
                OptionBox(
                  // icon: Icons.settings,
                  name: 'जमा-खर्च नोंदवही',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DepositExpFile(),
                      ),
                    );
                  },
                ),
                OptionBox(
                  //icon: Icons.settings,
                  name: 'उपक्रम तपशील',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EventDetails(
                          requestData: {},
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
