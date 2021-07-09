import 'package:flutter/material.dart';

class VehicleDocumentCreatePage extends StatelessWidget {
  VehicleDocumentCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Vehicle Document'),
          leading: CloseButton(),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {},
              child: const Text('SAVE'),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('images/no_img.png')),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Document Name',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              InputDatePickerFormField(
                firstDate: DateTime.now(),
                lastDate:  DateTime(2101),
              ),
            ],
          ),
        ));
  }
}
