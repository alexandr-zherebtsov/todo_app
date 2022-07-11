import 'package:sqflite/sqflite.dart';
import 'package:todo_app/domain/models/task_model.dart';

class LocalDB {
  static const String _dbName = 'todo_db.db';
  static const String _tacks = 'tasks';
  String get tacks => _tacks;

  late final Database db;

  Future<void> init() async {
    db = await openDatabase(
      _dbName,
      version: 1,
    );
    await createTacksIfNotExist();
  }

  Future<void> createTacksIfNotExist() async {
    await db.execute(""" CREATE TABLE IF NOT EXISTS $_tacks (
        ${TaskModel.cId} INTEGER,
        ${TaskModel.cTitle} TEXT,
        ${TaskModel.cCreatedAt} INTEGER,
        ${TaskModel.cDate} INTEGER,
        ${TaskModel.cImportance} TEXT,
        ${TaskModel.cLabel} TEXT,
        ${TaskModel.cFile} BLOB,
        ${TaskModel.cFileFormat} TEXT,
        ${TaskModel.cFileAsset} TEXT
      );""");
  }

  Future<void> createTacks() async {
    await db.execute("""CREATE TABLE $_tacks (
        ${TaskModel.cId} INTEGER,
        ${TaskModel.cTitle} TEXT,
        ${TaskModel.cCreatedAt} INTEGER
        ${TaskModel.cDate} INTEGER,
        ${TaskModel.cImportance} TEXT,
        ${TaskModel.cLabel} TEXT,
        ${TaskModel.cFile} BLOB,
        ${TaskModel.cFileFormat} TEXT,
        ${TaskModel.cFileAsset} TEXT
    );""");
  }

  Future<void> dropTacks() async {
    await db.execute("""DROP TABLE IF EXISTS $_tacks""");
  }

  Future<void> close() async {
    await db.close();
  }
}
