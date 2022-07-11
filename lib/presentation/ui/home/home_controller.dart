import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/models/task_model.dart';
import 'package:todo_app/presentation/router/routes.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/screen_enums.dart';
import 'package:todo_app/shared/utils/utils.dart';

class HomeController extends GetxController {
  final TackRepository _tr;
  HomeController(this._tr);

  ScreenEnums _screenEnum = ScreenEnums.none;
  ScreenEnums get screenEnum => _screenEnum;
  set screenEnum(ScreenEnums v) {
    _screenEnum = v;
    update();
  }

  List<TaskModel> tasks = <TaskModel>[];

  @override
  void onInit() async {
    super.onInit();
    screenEnum = ScreenEnums.loading;
    await getTasks();
    screenEnum = ScreenEnums.loaded;
  }

  Future<void> getTasks() async => tasks = await _tr.getTasks();

  void goTask({final int? id}) async {
    if (id != null) {
      final res = await Get.toNamed(
        AppRoutes.task,
        arguments: id,
      );
      if (res == ScreenEnums.refresh) {
        onInit();
      }
    }
  }

  void goCreateTask({final int? id}) async {
    await delayedFunc(milliseconds: 40);
    final res = await Get.toNamed(
      AppRoutes.createTask,
      arguments: id,
    );
    if (res == ScreenEnums.refresh) {
      onInit();
    }
  }

  void deleteTask({final int? id}) async {
    if (id != null) {
      final bool res = await _tr.deleteTack(id);
      if (res) {
        toast(StringsKeys.done.tr);
        onInit();
      } else {
        toast(StringsKeys.somethingWentWrong.tr);
      }
    }
  }
}
