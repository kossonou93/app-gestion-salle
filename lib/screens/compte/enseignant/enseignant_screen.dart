import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/accueil/accueil_screen.dart';
import 'package:gestionsalle/screens/compte/enseignant/components/body.dart';

class CompteEnseignantScreen extends StatelessWidget {
  static String routeName = "/register_enseignant";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AccueilScreen.routeName),
        ),
        title: Text("Créer Compte Enseignant"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
