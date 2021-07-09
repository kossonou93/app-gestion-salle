import 'package:flutter/material.dart';
import 'package:gestionsalle/api/rest_api.dart';
import 'package:gestionsalle/components/default_button.dart';
import 'package:gestionsalle/screens/consultation/videoprojecteur/components/allVideoPro.dart';
import 'package:gestionsalle/size_config.dart';
import 'package:combos/combos.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ConsultVideoProForm extends StatefulWidget {
  @override
  _ConsultVideoProFormState createState() => _ConsultVideoProFormState();
}

class _ConsultVideoProFormState extends State<ConsultVideoProForm> {
  final _formKey = GlobalKey<FormState>();
  ApiService allVideoPro = new ApiService();
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
              child: (_item == null)?  Text('Sélectionnez le vidéoprojecteur'): Text(_item)
            ),
            getList: () async {
              //allSalle.getSalle()
              var data = await allVideoPro.getVideoPro();
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
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Valider",
            press: () async {
              if (_formKey.currentState.validate()) {
                 ApiService getSalle = new ApiService();
                response = await getSalle.getReservationVideoProjecteur(_item, _debut ,_fin);
                //_response = response;
                print(response);
                if (response == 401) {
                   Toast.show("Video projector or Date no send", context);
                   return;
                }
                if (response.length == 0) {
                  Toast.show("Aucune reservation pour cette date", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                  return;
                } else {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllVideoProScreen(value : response),
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
