import 'package:todo_app/domain/models/task_model.dart';

abstract class TackRepository {
  Future<TaskModel?> insertTask(TaskModel task);

  Future<List<TaskModel>> getTasks();

  Future<TaskModel?> getTask(final int id);

  Future<TaskModel?> updateTack(final TaskModel task);

  Future<bool> deleteTack(final int id);
}
