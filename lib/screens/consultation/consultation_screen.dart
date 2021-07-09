import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/accueil/accueil_screen.dart';
import 'package:gestionsalle/screens/consultation/components/body.dart';

class ConsultationScreen extends StatelessWidget {
  static String routeName = "/consultation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AccueilScreen.routeName),
        ),
        title: Text("Vérification disponibilité"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
