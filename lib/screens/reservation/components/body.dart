import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/reservation/components/reservation_form.dart';
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
                  "Réservez",
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
                ReservationForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                
                SizedBox(height: getProportionateScreenHeight(20)),
                //NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
