class DoctorDb {
  int id;
  String name;
  DoctorDb(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  DoctorDb.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
