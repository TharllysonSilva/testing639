import 'package:flutter/material.dart';
import 'package:testing639/pages/auth_page.dart';
import 'package:testing639/pages/login_page.dart';
import 'package:testing639/pages/weather_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testing639/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
