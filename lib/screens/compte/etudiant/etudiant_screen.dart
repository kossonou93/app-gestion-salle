import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/accueil/accueil_screen.dart';
import 'package:gestionsalle/screens/compte/etudiant/components/body.dart';

class CompteEtudiantScreen extends StatelessWidget {
  static String routeName = "/register_etudiant";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AccueilScreen.routeName),
        ),
        title: Text("Créer Compte Etudiant"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
