import 'dart:developer';

import 'package:todo_app/data/local_db/local_db.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/models/task_model.dart';

class TackRepositoryImpl extends TackRepository {
  final LocalDB _db;

  TackRepositoryImpl(this._db);

  @override
  Future<TaskModel?> insertTask(TaskModel task) async {
    try {
      await _db.db.insert(
        _db.tacks,
        task.toMap(),
      );
      return task;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return null;
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> res = <TaskModel>[];
    try {
      final List<Map<String, dynamic>> maps = await _db.db.query(
        _db.tacks,
        columns: TaskModel.columns,
        orderBy: '${TaskModel.cDate} DESC',
      );
      if (maps.isNotEmpty) {
        res = (maps).map((e) => TaskModel.fromMap(e)).toList();
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);

    }
    return res;
  }

  @override
  Future<TaskModel?> getTask(final int id) async {
    try {
      final List<Map<String, dynamic>> maps = await _db.db.query(
        _db.tacks,
        columns: TaskModel.columns,
        where: '${TaskModel.cId} = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return TaskModel.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return null;
    }
  }

  @override
  Future<TaskModel?> updateTack(final TaskModel task) async {
    try {
      await _db.db.update(
        _db.tacks,
        task.toMap(),
        where: '${TaskModel.cId} = ?',
        whereArgs: [task.id],
      );
      return task;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return null;
    }
  }

  @override
  Future<bool> deleteTack(final int id) async {
    try {
      await _db.db.delete(
        _db.tacks,
        where: '${TaskModel.cId} = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return false;
    }
  }
}
