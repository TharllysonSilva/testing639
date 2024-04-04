import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
        //profile pic
        children: [
          const SizedBox(height: 50),
          Icon(
            Icons.person,
            size: 72,
          ),
          const SizedBox(height: 10),
          //user email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          //user details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Meus detalhes',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          //user name
        ],
      ),
    );
  }
}
