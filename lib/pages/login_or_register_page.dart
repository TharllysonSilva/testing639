import 'package:flutter/material.dart';
import 'package:testing639/pages/login_page.dart';
import 'package:testing639/pages/register_page.dart';
import 'package:testing639/pages/weather_page.dart';

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
      return LoginPage(onTap: togglePage);
    } else {
      return RegisterPage(
        onTap: togglePage,
      );
    }
  }
}
