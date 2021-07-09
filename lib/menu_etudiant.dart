import 'package:flutter/material.dart';
import 'package:gestionsalle/constants.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';
import 'package:gestionsalle/splash/splash_screen.dart';

class MenuEtudiant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserAccountsDrawerHeader(
          accountName: null,
          accountEmail: null,
          decoration: BoxDecoration(color: kPrimaryColor),
        ),
        ///*
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, SplashScreen.routeName),
        ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Vérification"),
            onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
          leading: Icon(Icons.settings_power),
          title: Text("Déconnexion"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, SplashScreen.routeName),
        ),
      ],
    ));
  }
}
