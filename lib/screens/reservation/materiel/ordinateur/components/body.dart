import 'package:flutter/material.dart';
import 'package:gestionsalle/constants.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:gestionsalle/screens/reservation/materiel/ordinateur/components/ordinateur_form.dart';

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
                Text("Réservez un ordinateur", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                OrdinateurForm(),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Tout droit réservé Copyrigth @ 2020',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
