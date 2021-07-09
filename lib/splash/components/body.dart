import 'package:flutter/material.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/constants.dart';
import 'package:gestionsalle/screens/login/login_screen.dart';
import 'package:gestionsalle/screens/register/register_screen.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:gestionsalle/splash/components/splash_content.dart';

//import '../produit_service.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Reservation des salles pour vos réunions ou conférences",
      "image": "assets/images/salle.jpg"
    },
    {
      "text":
          "Réservation de vidéo projecteur",
      "image": "assets/images/video.jpg"
    },
    {
      "text": "Réservation d'ordinateur pour vos réunions",
      "image": "assets/images/pc.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 2),
                    DefaultButton(
                      text: "Connexion-Enseignant",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                    DefaultButton(
                      text: "Connexion-Etudiant",
                      press: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
