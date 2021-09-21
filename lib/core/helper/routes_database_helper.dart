import 'dart:async';
import 'dart:io';

import 'package:nestle_app/core/model/DTODriverRoute.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class RoutesDatabaseHelper {
  // ignore: non_constant_identifier_names
  static final DATABASE_NAME = "KEAS_DB.db";
  // ignore: non_constant_identifier_names
  final DATABASE_VERSION = 1;
  // ignore: non_constant_identifier_names
  final TABLE = "driver_route";
  // ignore: non_constant_identifier_names
  final COLUMN_ID = "Id";
  // ignore: non_constant_identifier_names
  final COLUMN_LAT = "Lat";
  // ignore: non_constant_identifier_names
  final COLUMN_LON = "Lon";
  // ignore: non_constant_identifier_names
  final COLUMN_SPEED = "Speed";
  // ignore: non_constant_identifier_names
  final COLUMN_USER_ID = "UserId";
  // ignore: non_constant_identifier_names
  final COLUMN_TASK_ID = "TaskId";
  // ignore: non_constant_identifier_names
  final COLUMN_TRUCK_ID = "TruckId";
  // ignore: non_constant_identifier_names
  final COLUMN_RELATION_ID = "RelationId";
  // ignore: non_constant_identifier_names
  final COLUMN_IS_DANGER_AREA = "IsDangerArea";
  // ignore: non_constant_identifier_names
  final COLUMN_IS_BREAK_AREA = "IsBreakArea";
  // ignore: non_constant_identifier_names
  final COLUMN_RECORD_DATE = "RecordDate";
  // ignore: non_constant_identifier_names
  final COLUMN_IS_DELETED = "IsDeleted";

  RoutesDatabaseHelper._privateConstructor();

  static final RoutesDatabaseHelper instance = RoutesDatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database?> open() async {
    try {
      Directory dbDir = await getApplicationDocumentsDirectory();
      String path = p.join(dbDir.path, DATABASE_NAME);
      _database = await openDatabase(path, version: DATABASE_VERSION, onCreate: _onCreateTable);
    } catch (e) {
      print("ROUTES_DATABASE_HELPER (OPEN_ERROR) : " + e.toString());
    }
  }

  Future _onCreateTable(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE $TABLE (
      $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $COLUMN_LAT NUMERIC,
      $COLUMN_LON NUMERIC,
      $COLUMN_SPEED NUMERIC,
      $COLUMN_USER_ID INTEGER,
      $COLUMN_TASK_ID INTEGER,
      $COLUMN_TRUCK_ID INTEGER,
      $COLUMN_RELATION_ID INTEGER,
      $COLUMN_IS_DANGER_AREA INTEGER,
      $COLUMN_IS_BREAK_AREA INTEGER,
      $COLUMN_RECORD_DATE DATETIME,
      $COLUMN_IS_DELETED INTEGER
    );
    ''');
  }

  Future<List<DTODriverRoute>> getItemByTaskId(int taskId) async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      List? routesMaps = await _database?.query(
        TABLE,
        where: '$COLUMN_TASK_ID = ?',
        whereArgs: [taskId],
        columns: [
          COLUMN_ID,
          COLUMN_LAT,
          COLUMN_LON,
          COLUMN_SPEED,
          COLUMN_USER_ID,
          COLUMN_TASK_ID,
          COLUMN_TRUCK_ID,
          COLUMN_RELATION_ID,
          COLUMN_IS_DANGER_AREA,
          COLUMN_IS_BREAK_AREA,
          COLUMN_RECORD_DATE,
          COLUMN_IS_DELETED
        ],
      );

      if (routesMaps!.length > 0)
        return routesMaps.map((e) => DTODriverRoute.fromJson(e)).toList();
      else
        return [];
    } catch (e) {
      print("ROUTES_DATABASE_HELPER (GETITEM_ERROR) : " + e.toString());
      return [];
    }
  }

  Future<List<DTODriverRoute>> getAllItems() async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      List? routesMaps = await _database?.query(TABLE);
      return routesMaps!.map((e) => DTODriverRoute.fromJson(e)).toList();
    } catch (e) {
      print("ROUTES_DATABASE_HELPER (GETITEMS_ERROR) : " + e.toString());
      return [];
    }
  }

  Future<bool> insertItem(DTODriverRoute model) async {
    try {
      if (_database == null) await open();
      if (_database!.isOpen == false) await open();

      int? result = await _database?.insert(TABLE, model.toJson());
      return result != null;
    } catch (e) {
      print("ROUTES_DATABASE_HELPER (INSERT_ERROR) : " + e.toString());
      return false;
    }
  }

  Future<bool> removeItemByTaskId(int taskId) async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      int? result = await _database?.delete(TABLE, where: '$COLUMN_TASK_ID = ?', whereArgs: [taskId]);
      return result != null;
    } catch (e) {
      print("ROUTES_DATABASE_HELPER (REMOVE_ITEM_ERROR) : " + e.toString());
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
      print("ROUTES_DATABASE_HELPER (REMOVE_ITEM_ERROR) : " + e.toString());
      return false;
    }
  }

  Future<bool> updateItem(int id, DTODriverRoute model) async {
    if (_database == null) await open();
    if (_database!.isOpen == false) await open();

    try {
      final result = await _database?.update(TABLE, model.toJson(), where: '$COLUMN_ID = ?', whereArgs: [id]);
      return result != null;
    } catch (e) {
      print("ROUTES_DATABASE_HELPER (UPDATE_ITEM_ERROR) : " + e.toString());
      return false;
    }
  }

  Future<void> closeDb() async {
    if (_database!.isOpen && _database != null) {
      try {
        await _database!.close();
      } catch (e) {
        print("ROUTES_DATABASE_HELPER (CLOSE_DB_ERROR) : " + e.toString());
      }
    }
  }
}
