import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';
import 'package:gestionsalle/screens/consultation/salle/components/body.dart';

class ConsultSalleScreen extends StatelessWidget {
  static String routeName = "/consultationsalle";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
        ),
        title: Text("Disponibilité Salle"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
