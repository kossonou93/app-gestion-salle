import 'package:flutter/material.dart';
import 'package:gestionsalle/api/rest_api.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/screens/consultation/ordinateur/components/allordinateur.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';
import 'package:combos/combos.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ConsultOrdinateurForm extends StatefulWidget {
  @override
  _ConsultOrdinateurFormState createState() => _ConsultOrdinateurFormState();
}

class _ConsultOrdinateurFormState extends State<ConsultOrdinateurForm> {
  final _formKey = GlobalKey<FormState>();
  ApiService allOrdinateur = new ApiService();
  var response;
  DateTime selectedDate;
  String _item ;
  String _debut;
  String _fin;
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
          ListCombo<String>(
            child:  Padding(
              padding: EdgeInsets.all(16),
              child: (_item == null)?  Text("Sélectionnez l'ordinateur"): Text(_item)
            ),
            getList: () async {
              //allSalle.getSalle()
              var data = await allOrdinateur.getOrdinateur();
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
            SizedBox(height: getProportionateScreenHeight(20)),
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
                 ApiService getOrdinateur = new ApiService();
                response = await getOrdinateur.getReservationOrdinateur(_item, _debut ,_fin);
                //_response = response;
                print(response);
                //_formKey.currentState.save();
                // if all are valid then go to success screen
                if (response == 401) {
                   Toast.show("Ordinateur or Date no send", context);
                   return;
                }
                if (response.length == 0) {
                  Toast.show("Aucune reservation pour cette date", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                  return;
                } else {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllOrdinateurScreen(value : response),
                ));
                }
              }
            },
            //},
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
        ],
      ),
    );
  }

}
