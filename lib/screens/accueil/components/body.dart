import 'package:flutter/material.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';
import 'package:gestionsalle/screens/reservation/reservation_screen.dart';
import 'package:gestionsalle/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Réservez ou vérifiez la disponibilité de",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Vos Salles, Ordinateurs, Vidéos projecteurs selon leur disponibilté",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                DefaultButton(
                    text: "Réserver",
                    press: () {
                      Navigator.pushNamed(context, ReservationScreen.routeName);
                    },
                  ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                DefaultButton(
                    text: "Vérifier",
                    press: () {
                      Navigator.pushNamed(context, ConsultationScreen.routeName);
                    },
                  ),
                //NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
