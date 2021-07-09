import 'package:flutter/material.dart';
import 'package:gestionsalle/api/rest_api.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/components/form_error.dart';
import 'package:gestionsalle/constants.dart';
import 'package:gestionsalle/screens/login/login_screen.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:toast/toast.dart';

class CompteEnseignantForm extends StatefulWidget {
  @override
  _CompteEnseignantFormState createState() => _CompteEnseignantFormState();
}

class _CompteEnseignantFormState extends State<CompteEnseignantForm> {
 
  
  final _formKey = GlobalKey<FormState>();
  String email;
  String contact;
  String name;
  String username;
  String password;
  bool remember = false;
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final contactController = new TextEditingController();
  final nameController = new TextEditingController();
  final usernameController = new TextEditingController();

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
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildContactFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
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
            text: "Inscription",
            press: () async {
              if (_formKey.currentState.validate()) {
                 ApiService connexion = new ApiService();
                var response = await connexion.signUpEnseignant(contactController.value.text, emailController.value.text, nameController.value.text, passwordController.value.text, usernameController.value.text);
                if (response == 401) {
                   Toast.show("Veillez renseigner correctement les champs", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return;
                }
                Toast.show("Votre compte a été créé avec succès", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                Navigator.pushNamed(context, SignInScreen.routeName);

              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildContactFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: contactController,
      onSaved: (newValue) => contact = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } 
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Contact",
        hintText: "Entrez votre contact",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        } 
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nom",
        hintText: "Entrez votre nom",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: usernameController,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        } 
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Entrez votre username",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
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
