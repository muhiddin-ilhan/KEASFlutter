import 'dart:async';
import 'dart:io';

import 'package:nestle_app/core/model/DTODangerArea.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DangerAreasDatabaseHelper {
  // ignore: non_constant_identifier_names
  static final DATABASE_NAME = "KEAS_DB_Danger.db";
  // ignore: non_constant_identifier_names
  final DATABASE_VERSION = 1;
  // ignore: non_constant_identifier_names
  final TABLE = "danger_areas";
  // ignore: non_constant_identifier_names
  final COLUMN_ID = "Id";
  // ignore: non_constant_identifier_names
  final COLUMN_AREA_TITLE = "AreaTitle";
  // ignore: non_constant_identifier_names
  final COLUMN_POLYGON = "Polygon";
  // ignore: non_constant_identifier_names
  final COLUMN_RECORD_DATE = "RecordDate";
  // ignore: non_constant_identifier_names
  final COLUMN_IS_DELETED = "IsDeleted";

  DangerAreasDatabaseHelper._privateConstructor();

  static final DangerAreasDatabaseHelper instance = DangerAreasDatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database?> open() async {
    try {
      Directory dbDir = await getApplicationDocumentsDirectory();
      String path = p.join(dbDir.path, DATABASE_NAME);
      _database = await openDatabase(path, version: DATABASE_VERSION, onCreate: _onCreateTable);
    } catch (e) {
      print("DANGER_AREAS_DATABASE_HELPER (OPEN_ERROR) : " + e.toString());
    }
  }

  Future _onCreateTable(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE $TABLE (
      $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $COLUMN_AREA_TITLE TEXT,
      $COLUMN_POLYGON TEXT,
      $COLUMN_RECORD_DATE DATETIME,
      $COLUMN_IS_DELETED INTEGER
    );
    ''');
  }

  Future<List<DTODangerArea>> getItemById(int id) async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      List? routesMaps = await _database?.query(
        TABLE,
        where: '$COLUMN_ID = ?',
        whereArgs: [id],
        columns: [
          COLUMN_ID,
          COLUMN_AREA_TITLE,
          COLUMN_POLYGON,
          COLUMN_RECORD_DATE,
          COLUMN_IS_DELETED
        ],
      );

      if (routesMaps!.length > 0)
        return routesMaps.map((e) => DTODangerArea.fromJson(e)).toList();
      else
        return [];
    } catch (e) {
      print("DANGER_AREAS_DATABASE_HELPER (GETITEM_ERROR) : " + e.toString());
      return [];
    }
  }

  Future<List<DTODangerArea>> getAllItems() async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      List? routesMaps = await _database?.query(TABLE);
      return routesMaps!.map((e) => DTODangerArea.fromJson(e)).toList();
    } catch (e) {
      print("DANGER_AREAS_DATABASE_HELPER (GETITEMS_ERROR) : " + e.toString());
      return [];
    }
  }

  Future<bool> insertItem(DTODangerArea model) async {
    try {
      if (_database == null) await open();
      if (_database!.isOpen == false) await open();

      int? result = await _database?.insert(TABLE, model.toJson());
      return result != null;
    } catch (e) {
      print("DANGER_AREAS_DATABASE_HELPER (INSERT_ERROR) : " + e.toString());
      return false;
    }
  }

  Future<bool> removeItemById(int id) async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      int? result = await _database?.delete(TABLE, where: '$COLUMN_ID = ?', whereArgs: [id]);
      return result != null;
    } catch (e) {
      print("DANGER_AREAS_DATABASE_HELPER (REMOVE_ITEM_ERROR) : " + e.toString());
      return false;
    }
  }

  Future<bool> removeAllItem() async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      int? result = await _database?.delete(TABLE);
      return result != null;
    } catch (e) {
      print("DANGER_AREAS_DATABASE_HELPER (REMOVE_ITEM_ERROR) : " + e.toString());
      return false;
    }
  }

  Future<void> closeDb() async {
    if (_database!.isOpen && _database != null) {
      try {
        await _database!.close();
      } catch (e) {
        print("DANGER_AREAS_DATABASE_HELPER (CLOSE_DB_ERROR) : " + e.toString());
      }
    }
  }
}
