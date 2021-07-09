import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/reservation/materiel/videoprojecteur/components/body.dart';
import 'package:gestionsalle/screens/reservation/reservation_screen.dart';

class VideoProjecteurScreen extends StatelessWidget {
  static String routeName = "/reservationvideoprojecteur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ReservationScreen.routeName),
        ),
        title: Text("Réservation VideoProjecteur"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
