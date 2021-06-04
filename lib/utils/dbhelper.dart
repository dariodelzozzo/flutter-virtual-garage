import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Vehicle Db data
final String tableVehicleName = 'vehicles';
final String columnVehicleId = 'id';
final String columnVehicleName = 'name';
final String columnVehicleLicensePlate = 'licensePlate';
final String columnVehiclePhotoUri = 'photoUri';

// Document Db data
final String tableDocumentName = 'documents';
final String columnDocumentId = 'id';
final String columnDocumentName = 'name';
final String columnDocumentExpireDate = 'expire_date';
final String columnDocumentCreateDate = 'create_date';
final String columnDocumentVehicleId = 'vehicle_id';

class DbHelper {
  static const databaseName = 'virtual_garage.db';
  final int version = 1;
  Database db;

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), databaseName),
          onCreate: (database, version) {
        // Run the CREATE TABLE statement on the database.
        database.execute(
            'CREATE TABLE vehicles(id INTEGER PRIMARY KEY, name TEXT, licensePlate TEXT, photoUri TEXT)');
        database.execute(
            'CREATE TABLE documents(id INTEGER PRIMARY KEY, name TEXT, expire_date TEXT, create_date TEXT, vehicle_id INTEGER, FOREIGN KEY(vehicle_id) REFERENCES vehicles(id))');
      }, version: version);
    }
    return db;
  }

  Future testDb() async {
    db = await openDb();
    await db.execute(
        'INSERT INTO vehicles VALUES (0, "Vechicle Name", "AB12345CC", "/your/photo/uri/path")');
    await db.execute(
        'INSERT INTO documents VALUES (0, "Patente", "22/12/2020", "22/12/2020", 0)');

    List vehicles = await db.rawQuery('select * from $tableVehicleName');
    List documents = await db.rawQuery('select * from $tableDocumentName');
    print(vehicles[0].toString());
    print(documents[0].toString());
  }
}
