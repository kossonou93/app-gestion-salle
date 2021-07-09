import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';

class AllOrdinateurScreen extends StatelessWidget {
  var value;

  AllOrdinateurScreen({this.value});
  getList() {
      List<String> debut = new List<String>();
      for (var i = 0; i < value.length; i++) {
        value.add(value[i]['debut']);
      }
      return debut.toString();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
        ),
        title: Text("Ordinateur non disponible le"),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: new ListView.builder(
        itemCount: value.length,
          itemBuilder: (context, index) {
            return  Card(  
              child: Column(  
                mainAxisSize: MainAxisSize.min,  
                children: <Widget>[  
                  ListTile(  
                  leading: Icon(Icons.timer, size: 45),  
                  title: Text("${value[index][3]}\n${value[index][4]}"),  
                  //subtitle: Text(""),  
                ),  
              ],  
            ),  
          );  
        }
      )
    );
  }
}

class Salle {
  final String debut;
  final String fin;
  final String salle_id;

  Salle(this.debut, this.fin, this.salle_id);
}
