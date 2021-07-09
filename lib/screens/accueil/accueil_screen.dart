import 'package:flutter/material.dart';
import 'package:gestionsalle/app_drawer.dart';
import 'package:gestionsalle/screens/accueil/components/body.dart';

class AccueilScreen extends StatelessWidget {
  static String routeName = "/accueil";
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        title: Text('Menu'),
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
