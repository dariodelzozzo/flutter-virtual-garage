class Vehicle {
  int id;
  String name;
  String licensePlate;
  String photoUri;

  Vehicle(this.id, this.name, this.licensePlate, this.photoUri);

  // Convert a Vehicle into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': (id == 0) ? null : id,
      'name': name,
      'licensePlate': licensePlate,
      'photoUri': photoUri,
    };
  }
}
