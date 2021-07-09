import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';
import 'package:gestionsalle/screens/consultation/videoprojecteur/components/body.dart';

class ConsultVideoProScreen extends StatelessWidget {
  static String routeName = "/consultationvideopro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
        ),
        title: Text("Disponibilité Videoprojecteur"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
