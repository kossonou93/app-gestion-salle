import 'package:flutter/material.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/screens/reservation/materiel/ordinateur/ordinateur_screen.dart';
import 'package:gestionsalle/screens/reservation/materiel/videoprojecteur/videoprojecteur_screen.dart';
import 'package:gestionsalle/screens/reservation/salle/salle_screen.dart';
import 'package:gestionsalle/size_config.dart';

class ReservationForm extends StatefulWidget {
  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Salle",
            press: () {
              Navigator.pushNamed(context, SalleScreen.routeName);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Ordinateurs",
            press: () {
              Navigator.pushNamed(context, OrdianeteurScreen.routeName);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Vidéos Projecteurs",
            press: () {
              Navigator.pushNamed(context, VideoProjecteurScreen.routeName);
            },
          ),
        ],
      //),
    );
  }

}
