import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';
import 'package:gestionsalle/screens/consultation/ordinateur/components/body.dart';

class ConsultOrdinateurScreen extends StatelessWidget {
  static String routeName = "/consultationordinateur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
        ),
        title: Text("Disponibilité Ordinateur"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
