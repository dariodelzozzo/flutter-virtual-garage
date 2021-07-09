import 'package:flutter/material.dart';
import 'package:virtual_garage/vehicle_documents_list_page.dart';

class VehicleDetailsPage extends StatelessWidget {
  VehicleDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.document_scanner)),
              Tab(icon: Icon(Icons.car_repair_rounded)),
            ],
          ),
          title: const Text('Current Vehicle'),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(image: AssetImage('images/no_img.png')),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Vehicle Name'),
                      Text('Vehicle License Plate'),
                    ],
                  ),
                ],
              ),
            ),
            VehicleDocumentsListPage(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('List Of Vehicles Maintenances'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
