import 'package:firebase_/auth/auth_page.dart';
import 'package:firebase_/pages/home_page.dart';
import 'package:firebase_/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, Snapshot) {
            if (Snapshot.hasData) {
              return LoginPage(showRegisterPage: () {  },);
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
