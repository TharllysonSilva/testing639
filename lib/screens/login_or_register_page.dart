import 'package:flutter/material.dart';
import 'package:testing639/screens/login_page.dart';
import 'package:testing639/screens/register_page.dart';
import 'package:testing639/screens/weather_page.dart';

class LoginOrResgiterPage extends StatefulWidget {
  const LoginOrResgiterPage({super.key});

  @override
  State<LoginOrResgiterPage> createState() => _LoginOrResgiterPageState();
}

class _LoginOrResgiterPageState extends State<LoginOrResgiterPage> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const WeatherPage();
    } else {
      return LoginPage(
        onTap: togglePage,
      );
    }
  }
}
