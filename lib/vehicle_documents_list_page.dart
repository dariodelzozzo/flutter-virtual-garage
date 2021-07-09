import 'package:flutter/material.dart';
import 'package:virtual_garage/vehicle_document_create_page.dart';
import 'package:virtual_garage/vehicle_document_details_page.dart';
import 'models/document.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VehicleDocumentsListPage extends StatelessWidget {
  VehicleDocumentsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Document> documents = <Document>[];

    for (var i = 0; i <= 15; i++) {
      Document document =
          new Document(i, i, 'Name $i', 'Expired Date $i', 'Create Date $i');
      documents.add(document);
    }

    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: documents.length,
          itemBuilder: (BuildContext context, int index) {
            final document = documents[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: InkWell(
                splashColor: Colors.deepPurple.withAlpha(30),
                onTap: () {
                  // TODO Open document details StatefulWidget
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VehicleDocumentDetailsPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      _itemHeader(document),
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
            MaterialPageRoute(
                builder: (context) => VehicleDocumentCreatePage()),
          );
        },
        tooltip: 'Add new document',
        child: Icon(Icons.add),
      ),
    );
  }

  Row _itemHeader(Document document) {
    return Row(
      children: <Widget>[
        Image(width: 100, image: AssetImage('images/no_img.png')),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Document Name: " + document.name),
                Text("Document Expiration: " + document.expire_date),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
