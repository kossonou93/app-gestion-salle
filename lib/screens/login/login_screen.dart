import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/login/components/body.dart';
import 'package:gestionsalle/splash/splash_screen.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, SplashScreen.routeName),
        ),
        title: Text("Connexion Enseignant"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
