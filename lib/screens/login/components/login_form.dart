import 'package:flutter/material.dart';
import 'package:gestionsalle/api/rest_api.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/components/form_error.dart';
import 'package:gestionsalle/constants.dart';
import 'package:gestionsalle/screens/accueil/accueil_screen.dart';
import 'package:gestionsalle/screens/login/login_screen.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:toast/toast.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
 
  
  final _formKey = GlobalKey<FormState>();
  String email;
  String phone;
  String password;
  bool remember = false;
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    //context, ForgotPasswordScreen.routeName),
                    context,
                    SignInScreen.routeName),
                child: Text(
                  "Mot de Passe oublié",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Connexion",
            press: () async {
              if (_formKey.currentState.validate()) {
                 ApiService connexion = new ApiService();
                var response = await connexion.signIn(emailController.value.text, passwordController.value.text);
                print(response);
                if (response == 401) {
                   Toast.show("Email ou Mot de Passe Incorrect", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return;
                }
                if (response == null) {
                   Toast.show("Vous n'etes pas autorisé", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return;
                }
                Navigator.pushNamed(context, AccueilScreen.routeName);

              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mot de Passe*",
        hintText: "Entrez votre mot de passe",
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email*",
        hintText: "Entrez votre email",
      ),
    );
  }
}
