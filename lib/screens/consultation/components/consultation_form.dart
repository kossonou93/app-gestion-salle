import 'package:flutter/material.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/screens/consultation/ordinateur/consult_ordi_screen.dart';
import 'package:gestionsalle/screens/consultation/salle/consult_salle_screen.dart';
import 'package:gestionsalle/screens/consultation/videoprojecteur/consult_video_pro_screen.dart';
import 'package:gestionsalle/size_config.dart';

class ConsultationForm extends StatefulWidget {
  @override
  _ConsultationFormState createState() => _ConsultationFormState();
}

class _ConsultationFormState extends State<ConsultationForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Salles",
            press: () {
              Navigator.pushNamed(context, ConsultSalleScreen.routeName);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Ordinateurs",
            press: () {
              Navigator.pushNamed(context, ConsultOrdinateurScreen.routeName);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Vidéos Projecteurs",
            press: () {
              Navigator.pushNamed(context, ConsultVideoProScreen.routeName);
            },
          ),
        ],
      //),
    );
  }

}
