
import 'package:flutter/material.dart';
import 'package:gestionsalle/api/rest_api.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/constants.dart';
import 'package:gestionsalle/screens/reservation/reservation_screen.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:toast/toast.dart';
import 'package:combos/combos.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class OrdinateurForm extends StatefulWidget {
  @override
  _OrdinateurFormState createState() => _OrdinateurFormState();
}

class _OrdinateurFormState extends State<OrdinateurForm> {
  final _formKey = GlobalKey<FormState>();
 
  ApiService addOrdinateur = new ApiService();
  String email;
  String _item;
  String _debut;
  String _fin;
  final emailController = new TextEditingController();
  //var response;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  String initialValue;

  bool remember = false;
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
          ListCombo<String>(
            child:  Padding(
              padding: EdgeInsets.all(16),
              child: (_item == null)?  Text('Sélectionnez un ordinateur'): Text(_item)
            ),
            getList: () async {
              //allSalle.getSalle()
              var data = await addOrdinateur.getOrdinateur();
              List<String> name = new List<String>();
              for (var i = 0; i < data.length; i++) {
                name.add(data[i]['name']);
              }
              return name;
            },
            itemBuilder: (context, parameters, item) => ListTile(title: Text(item)),
            onItemTapped: (item)async {
              setState(() {
                _item = item.toString();
              });
            },
            
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Text(
                  "Veuillez sélectionnez l'heure et la date de début",
                  textAlign: TextAlign.left,
                ),
          DateTimeField(
          format: format,
          initialValue: DateTime.now(),
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              _debut = DateTimeField.combine(date, time).toString();
              return DateTimeField.combine(date, time);
            } else {
              print(currentValue);
              return currentValue;
            }
          },
        ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Text("Veuillez sélectionnez l'heure et la date de fin", textAlign: TextAlign.left),
          DateTimeField(
          format: format,
          initialValue: DateTime.now(),
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              _fin = DateTimeField.combine(date, time).toString();
              return DateTimeField.combine(date, time);
            } else {
              print(currentValue);
              return currentValue;
            }
          },
        ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Valider",
            press: () async {
              if (_formKey.currentState.validate()) {
                 ApiService addOrdinateur = new ApiService();
                var response = await addOrdinateur.addReservationOrdinateur(emailController.value.text,_item, _debut ,_fin);
                print(response);
                if (response.length == 0) {
                    Toast.show("Ordinateur reservé avec succèss", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                    Navigator.pushNamed(context, ReservationScreen.routeName); 
                }else{
                  Toast.show("Ordinateur déjà reservé! ", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return;
                }
                
              }
            },
          ),
        ],
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
