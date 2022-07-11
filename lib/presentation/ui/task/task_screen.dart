import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/ui/task/task_controller.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/importance_enums.dart';
import 'package:todo_app/shared/enums/label_enums.dart';
import 'package:todo_app/shared/enums/screen_enums.dart';
import 'package:todo_app/shared/utils/date_utils.dart';
import 'package:todo_app/shared/utils/utils.dart';
import 'package:todo_app/shared/widgets/app_bar_widget.dart';
import 'package:todo_app/shared/widgets/app_progress.dart';
import 'package:todo_app/shared/widgets/error_screen.dart';
import 'package:todo_app/shared/widgets/file_widget.dart';
import 'package:todo_app/shared/widgets/task_status.dart';

class TaskScreen extends GetView<TaskController> {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      autoRemove: false,
      builder: (_) {
        if (controller.screenEnum == ScreenEnums.loading) {
          return const AppProgress();
        } else if (controller.screenEnum == ScreenEnums.loaded) {
          return Scaffold(
            appBar: AppBarWidget(
              title: StringsKeys.todo.tr,
              back: controller.pop,
              actions: [
                IconButton(
                  tooltip: StringsKeys.delete.tr,
                  onPressed: controller.deleteTask,
                  icon: Icon(
                    isApple() ? CupertinoIcons.delete : Icons.delete_outline,
                  ),
                ),
                IconButton(
                  tooltip: StringsKeys.edit.tr,
                  onPressed: controller.goEditTask,
                  icon: Icon(
                    isApple() ? Icons.mode_edit_outlined : Icons.edit,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getDateYT(controller.task?.date),
                      style: Get.textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Text(
                        controller.task?.title ?? '',
                        style: Get.textTheme.bodyLarge,
                      ),
                    ),
                    TackStatus(
                      label: mapLabelEnums[controller.task?.label] ?? LabelEnums.none,
                      importance: mapImportanceEnums[controller.task?.importance] ?? ImportanceEnums.medium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FileWidget(
                        file: controller.task?.file,
                        fileFormat: controller.task?.fileFormat,
                        fileAsset: controller.task?.fileAsset,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
