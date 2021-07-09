import 'package:flutter/material.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:gestionsalle/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  final List<String> menuItems = ["Home", "Connexion Enseignant", "Connexion Etudiant", "Réservation"];
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      //drawer: AppDrawer(),
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Home'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Body(),
    );
  }
}
