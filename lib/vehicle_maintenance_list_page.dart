import 'package:flutter/material.dart';
import 'package:virtual_garage/vehicle_create_page.dart';
import 'package:virtual_garage/vehicle_details_page.dart';
import 'models/vehicle.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VehicleListPage extends StatelessWidget {
  VehicleListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Vehicle> vehicles = <Vehicle>[];

    for (var i = 0; i <= 15; i++) {
      Vehicle vehicle = new Vehicle(i, 'name $i', 'Targa $i', '');
      vehicle.photoUri = 'example.com';
      vehicles.add(vehicle);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Your Vehicles')),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: vehicles.length,
            itemBuilder: (BuildContext context, int index) {
              final vehicle = vehicles[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: InkWell(
                  splashColor: Colors.deepPurple.withAlpha(30),
                  onTap: () {
                    // TODO Open vehicle details StatefulWidget
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VehicleDetailsPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        _itemHeader(vehicle),
                      ],
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VehicleCreatePage()),
            );
          },
          tooltip: 'Add new vehicle',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Row _itemHeader(Vehicle vehicle) {
    return Row(
      children: <Widget>[
        Image(width: 100, image: AssetImage('images/no_img.png')),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Vehicle: " + vehicle.name),
                Text("License Plate: " + vehicle.licensePlate),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
