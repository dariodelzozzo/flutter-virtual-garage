import 'package:flutter/material.dart';

class VehicleDocumentDetailsPage extends StatelessWidget {
  VehicleDocumentDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document name details'),
      ),
      body: Center(child: Text('Here you can find Document details')),
    );
  }
}
