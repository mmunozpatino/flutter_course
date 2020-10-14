import 'dart:io';

import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


//patron singleton
class DbProvider {  
  static Database _db;
  static final DbProvider instance = DbProvider._();

  //esta notación es común para el constructor privado de la clase
  DbProvider._() {

  } 

  Future<Database> get database async {
    if(_db != null) return _db;

    _db = await initDB();

    return _db;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'scans.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int i) async {
        await db.execute(
          'CREATE TABLE scans ( '
          ' id INTEGER PRIMARY KEY,'
          ' type TEXT,'
          ' value TEXT'
        );
      }
    );
  }

  newScanRaw(ScanModel scan) async{
    final db = await database;

    final res = await db.rawInsert(
      "INSERT INTO scans (id, type, value) "
      "VALUES ( '${scan.id}', '${scan.type}', '${scan.value}' )"
    );

    return res; //return 1 if is inserted
  }

  newScan(ScanModel scan) async {
    final db = await database;

    final res = db.insert('scans', scan.toJson());

    return res;
  }

}