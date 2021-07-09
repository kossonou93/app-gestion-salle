import 'package:flutter/material.dart';
import 'package:gestionsalle/screens/accueil/accueil_etudiant_screen.dart';
import 'package:gestionsalle/screens/accueil/accueil_screen.dart';
import 'package:gestionsalle/screens/compte/enseignant/enseignant_screen.dart';
import 'package:gestionsalle/screens/compte/etudiant/etudiant_screen.dart';
import 'package:gestionsalle/screens/consultation/consultation_screen.dart';
import 'package:gestionsalle/screens/consultation/ordinateur/consult_ordi_screen.dart';
import 'package:gestionsalle/screens/consultation/salle/consult_salle_screen.dart';
import 'package:gestionsalle/screens/consultation/videoprojecteur/consult_video_pro_screen.dart';
import 'package:gestionsalle/screens/home/home_screen.dart';
import 'package:gestionsalle/screens/login/login_screen.dart';
import 'package:gestionsalle/screens/register/register_screen.dart';
import 'package:gestionsalle/screens/reservation/materiel/ordinateur/ordinateur_screen.dart';
import 'package:gestionsalle/screens/reservation/materiel/videoprojecteur/videoprojecteur_screen.dart';
import 'package:gestionsalle/screens/reservation/reservation_screen.dart';
import 'package:gestionsalle/screens/reservation/salle/salle_screen.dart';
import 'package:gestionsalle/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ReservationScreen.routeName:(context) => ReservationScreen(),
  SalleScreen.routeName:(context) => SalleScreen(),
  OrdianeteurScreen.routeName:(context) => OrdianeteurScreen(),
  VideoProjecteurScreen.routeName:(context) => VideoProjecteurScreen(),
  ConsultationScreen.routeName:(context) => ConsultationScreen(),
  ConsultSalleScreen.routeName:(context) => ConsultSalleScreen(),
  ConsultVideoProScreen.routeName:(context) => ConsultVideoProScreen(),
  ConsultOrdinateurScreen.routeName:(context) => ConsultOrdinateurScreen(),
  AccueilScreen.routeName:(context) => AccueilScreen(),
  AccueilEtudiantScreen.routeName:(context) => AccueilEtudiantScreen(),
  CompteEtudiantScreen.routeName:(context) => CompteEtudiantScreen(),
  CompteEnseignantScreen.routeName:(context) => CompteEnseignantScreen(),
};
