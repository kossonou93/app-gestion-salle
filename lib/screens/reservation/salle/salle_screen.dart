import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/reservation/salle/components/body.dart';
import 'package:gestionsalle/screens/reservation/reservation_screen.dart';

class SalleScreen extends StatelessWidget {
  static String routeName = "/reservationsalle";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ReservationScreen.routeName),
        ),
        title: Text("Reservation Salle"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
