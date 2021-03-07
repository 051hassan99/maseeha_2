import 'package:maseeha_2/doctor_db_class.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'maseeha.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE Doctor (id INTEGER PRIMARY KEY, name TEXT)');
  }

  Future<DoctorDb> add(DoctorDb doctorDb) async {
    var dbClient = await db;
    doctorDb.id = await dbClient.insert('Doctor', doctorDb.toMap());
    return doctorDb;
  }

  Future<List<DoctorDb>> getdoctor() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Doctor', columns: ['id', 'name']);
    List<DoctorDb> doctorDb = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        doctorDb.add(DoctorDb.fromMap(maps[i]));
      }
    }
    return doctorDb;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'Doctor',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(DoctorDb doctorDb) async {
    var dbClient = await db;
    return await dbClient.update(
      'Doctor',
      doctorDb.toMap(),
      where: 'id = ?',
      whereArgs: [doctorDb.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
