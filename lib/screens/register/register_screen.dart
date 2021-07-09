import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/register/components/body.dart';
import 'package:gestionsalle/splash/splash_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, SplashScreen.routeName),
        ),
        title: Text("Connexion Etudiant"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
