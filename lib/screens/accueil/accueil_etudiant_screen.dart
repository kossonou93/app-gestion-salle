import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/accueil/components/etudiant_form.dart';
import 'package:gestionsalle/menu_etudiant.dart';

class AccueilEtudiantScreen extends StatelessWidget {
  static String routeName = "/accueiletudiant";
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      drawer: MenuEtudiant(),
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        title: Text('Menu'),
        actions: [
          //Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Color(0xFFFF7643),
      ),
      body: EtudiantBody(),
    );
  }
}
