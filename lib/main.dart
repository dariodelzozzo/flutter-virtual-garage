import 'package:flutter/material.dart';
import 'vehicle_list_page.dart';
import 'package:flutter/widgets.dart';
import './utils/dbhelper.dart';

void main() => runApp(VirtualGarage());

class VirtualGarage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DbHelper helper = DbHelper();
    helper.testDb();
    return MaterialApp(
      title: 'Virtual Garage',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: VehicleListPage(),
    );
  }
}
