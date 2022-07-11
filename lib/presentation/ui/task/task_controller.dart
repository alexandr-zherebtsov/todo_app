import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/models/task_model.dart';
import 'package:todo_app/presentation/router/routes.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/screen_enums.dart';

class TaskController extends GetxController {
  final TackRepository _tr;

  TaskController(this._tr);

  ScreenEnums popResult = ScreenEnums.none;

  ScreenEnums _screenEnum = ScreenEnums.none;
  ScreenEnums get screenEnum => _screenEnum;
  set screenEnum(ScreenEnums v) {
    _screenEnum = v;
    update();
  }

  TaskModel? task;

  @override
  void onInit() async {
    super.onInit();
    screenEnum = ScreenEnums.loading;
    final int? id = Get.arguments as int?;
    if (id != null) {
      await getTask(id);
      screenEnum = ScreenEnums.loaded;
      if (task == null) {
        screenEnum = ScreenEnums.error;
      }
    } else {
      screenEnum = ScreenEnums.error;
    }
  }

  Future<void> getTask(final int id) async => task = await _tr.getTask(id);

  void goEditTask() async {
    if (task?.id != null) {
      final res = await Get.toNamed(
        AppRoutes.createTask,
        arguments: task!.id!,
      );
      if (res == ScreenEnums.refresh) {
        popResult = ScreenEnums.refresh;
        onInit();
      }
    }
  }

  void deleteTask() async {
    if (task?.id != null) {
      final bool res = await _tr.deleteTack(task!.id!);
      if (res) {
        toast(StringsKeys.done.tr);
        popResult = ScreenEnums.refresh;
        pop();
      } else {
        toast(StringsKeys.somethingWentWrong.tr);
      }
    }
  }

  Future<bool> pop() async {
    Get.back(result: popResult);
    return true;
  }
}
