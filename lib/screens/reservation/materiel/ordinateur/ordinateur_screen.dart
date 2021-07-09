import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/reservation/materiel/ordinateur/components/body.dart';
import 'package:gestionsalle/screens/reservation/reservation_screen.dart';

class OrdianeteurScreen extends StatelessWidget {
  static String routeName = "/reservationordinateur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ReservationScreen.routeName),
        ),
        title: Text("Reservation Ordinateur"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
