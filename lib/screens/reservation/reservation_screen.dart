import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/accueil/accueil_screen.dart';
import 'package:gestionsalle/screens/reservation/components/body.dart';

class ReservationScreen extends StatelessWidget {
  static String routeName = "/reservation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AccueilScreen.routeName),
        ),
        title: Text("Réservation"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
