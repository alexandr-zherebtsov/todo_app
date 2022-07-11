import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/ui/create_task/create_task_controller.dart';
import 'package:todo_app/presentation/ui/create_task/widgets/create_bottom_actions.dart';
import 'package:todo_app/shared/widgets/file_widget.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/screen_enums.dart';
import 'package:todo_app/shared/styles/styles.dart';
import 'package:todo_app/shared/utils/date_utils.dart';
import 'package:todo_app/shared/widgets/app_bar_widget.dart';
import 'package:todo_app/shared/widgets/app_progress.dart';
import 'package:todo_app/shared/widgets/error_screen.dart';
import 'package:todo_app/shared/widgets/task_status.dart';

class CreateTaskScreen extends GetView<CreateTaskController> {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTaskController>(
      autoRemove: false,
      builder: (_) {
        if (controller.screenEnum == ScreenEnums.loading) {
          return const AppProgress();
        } else if (controller.screenEnum == ScreenEnums.loaded) {
          return GestureDetector(
            onTap: controller.unFocus,
            child: WillPopScope(
              onWillPop: controller.pop,
              child: Scaffold(
                appBar: AppBarWidget(
                  title: StringsKeys.create.tr,
                  back: controller.pop,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 6,
                            bottom: 12,
                          ),
                          child: Obx(
                            () => Text(
                              getDateTimeFormat(controller.date.value),
                              style: Get.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        TextField(
                          autofocus: true,
                          maxLines: null,
                          cursorColor: Get.theme.primaryColor,
                          focusNode: controller.descriptionFN,
                          controller: controller.descriptionTC,
                          decoration: AppStyles.noBorderTF(
                            hintText: StringsKeys.description.tr,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2600),
                          ],
                        ),
                        TackStatus(
                          label: controller.label,
                          importance: controller.importance,
                          padding: const EdgeInsets.only(
                            left: 6,
                            top: 12,
                            bottom: 10,
                          ),
                        ),
                        FileWidget(
                          file: controller.file,
                          fileFormat: controller.fileFormat,
                          fileAsset: controller.fileAsset,
                          remove: controller.removeFile,
                        ),
                        const SizedBox(height: 100)
                      ],
                    ),
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: CreateBottomActions(
                  date: controller.date,
                  setLabel: controller.setLabel,
                  setImportance: controller.setImportance,
                  attachFile: controller.attachFile,
                  onTapSave: controller.onTapSave,
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
