import 'package:flutter/material.dart';
import 'package:gestionsalle/constants.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:gestionsalle/screens/consultation/salle/components/consult_salle_form.dart';

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
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                  "Vérifiez la disponibilité d'une salle",
                  style: headingStyle,
                  textAlign: TextAlign.center,
                  ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                ConsultSalleForm(),
                //SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
