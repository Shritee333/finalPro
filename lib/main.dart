import 'package:final_pro/HomeScreen.dart';
import 'package:final_pro/MemPerPass.dart';
import 'package:final_pro/MemSav.dart';
import 'package:final_pro/SplashScreen.dart';
import 'package:final_pro/adminHomeScreen.dart';
import 'package:final_pro/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AdminHome(),
      ),
    ),
  );
}
