import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/ui/home/home_controller.dart';
import 'package:todo_app/presentation/ui/home/widgets/task_item.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/screen_enums.dart';
import 'package:todo_app/shared/utils/date_utils.dart';
import 'package:todo_app/shared/utils/utils.dart';
import 'package:todo_app/shared/widgets/app_bar_widget.dart';
import 'package:todo_app/shared/widgets/app_buttons.dart';
import 'package:todo_app/shared/widgets/app_progress.dart';
import 'package:todo_app/shared/widgets/error_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      builder: (_) {
        if (controller.screenEnum == ScreenEnums.loading) {
          return const AppProgress();
        } else if (controller.screenEnum == ScreenEnums.loaded) {
          return Scaffold(
            appBar: const AppBarWidget(
              title: StringsKeys.todo,
            ),
            body: controller.tasks.isEmpty ? const ErrorScreen(
              title: StringsKeys.createTheFirstTask,
            ) : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.tasks.length,
              itemBuilder: (_, i) {
                return TaskItem(
                  task: controller.tasks[i],
                  edit: controller.goCreateTask,
                  delete: controller.deleteTask,
                  onTapItem: controller.goTask,
                  bottomMargin: i + 1 == controller.tasks.length,
                  hideDate: _checkDateSeparator(i),
                );
              },
            ),
            floatingActionButton: AppFloatActionButton(
              icon: isApple() ? CupertinoIcons.add : Icons.add,
              onPressed: controller.goCreateTask,
            ),
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }

  bool _checkDateSeparator(final int i) {
    bool hideDate = false;
    if (i != controller.tasks.length && i != 0 && controller.tasks.isNotEmpty) {
      if (isTheSameDay(
        firstDate: controller.tasks[i - 1].date,
        secondDate: controller.tasks[i].date,
      )) {
        hideDate = true;
      }
    }
    return hideDate;
  }
}
