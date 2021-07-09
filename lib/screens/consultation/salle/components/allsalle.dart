import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';
//import 'package:intl/intl.dart';

class AllSalleScreen extends StatelessWidget {
  var value;
  //DateTime dateTime = DateTime.parse("formattedString");

  AllSalleScreen({this.value});
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
        title: Text("Salle non disponible le"),
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
                  //subtitle: Text("data"),
                ),  
              ],  
            ),  
          );  
        }
      )
    );
  }
}
