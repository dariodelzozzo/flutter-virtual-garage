import 'package:flutter/material.dart';
import 'models/vehicle.dart';

class VehicleCreatePage extends StatelessWidget {
  VehicleCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Vehicle'),
          leading: CloseButton(),
          actions: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text("SAVE"),
              textColor: Colors.white,
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
                  labelText: 'Enter vehicle name',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter vehicle license plate',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
        ));
  }
}
