import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_done/models/recodnote.dart';

class DatabaseHelper{
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/record.db';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE tbl_record (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  purchase Text,
                  amount INTEGER )
    
    ''');
  }

  Future<int> addRecord( Record r) async{

    Database db = await instance.database;
    var result = db.insert('tbl_record', r.toMap());
    return result;
  }
  Future<List<Record>> getAllrecords() async {
    Database db = await instance.database;
    List<Map<String,Object?>> list = await db.query('tbl_record');

    List<Record> records = [];

    for(var recordMap in list){
      Record r = Record.fromMap(recordMap);
      records.add(r);
    }
    return records;
  }

}