import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/importance_enums.dart';
import 'package:todo_app/shared/enums/label_enums.dart';
import 'package:todo_app/shared/utils/date_utils.dart';
import 'package:todo_app/shared/utils/utils.dart';
import 'package:todo_app/shared/widgets/action_item.dart';
import 'package:todo_app/shared/widgets/app_buttons.dart';
import 'package:todo_app/shared/widgets/app_dialog.dart';
import 'package:todo_app/shared/widgets/label_widget.dart';

class CreateBottomActions extends StatelessWidget {
  final Rx<DateTime> date;
  final void Function(LabelEnums v) setLabel;
  final void Function(ImportanceEnums v) setImportance;
  final void Function() onTapSave;
  final void Function() attachFile;

  const CreateBottomActions({
    Key? key,
    required this.date,
    required this.setLabel,
    required this.setImportance,
    required this.onTapSave,
    required this.attachFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallIconButton(
                  message: StringsKeys.calendar,
                  icon: isApple() ? CupertinoIcons.calendar : Icons.calendar_month_outlined,
                  onPressed: () => getDate(date),
                ),
                SmallIconButton(
                  message: StringsKeys.label,
                  icon: isApple() ? CupertinoIcons.tag : Icons.invert_colors,
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  onPressed: onTapLabel,
                ),
                SmallIconButton(
                  message: StringsKeys.importance,
                  icon: isApple() ? CupertinoIcons.chevron_up : Icons.keyboard_arrow_up,
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  onPressed: onTapImportance,
                ),
                SmallIconButton(
                  message: StringsKeys.importance,
                  icon: isApple() ? CupertinoIcons.paperclip : Icons.attach_file,
                  onPressed: attachFile,
                ),
              ],
            ),
            SmallIconButton(
              message: StringsKeys.save,
              icon: isApple() ? CupertinoIcons.checkmark_alt : Icons.check,
              padding: const EdgeInsets.all(14),
              onPressed: onTapSave,
            ),
          ],
        ),
      ),
    );
  }

  void onTapLabel() {
    Get.focusScope?.unfocus();
    Get.dialog(
      AppDialog(
        children: allLabelEnums.map((v) => _buildLabelItem(v)).toList(),
      ),
    );
  }

  Widget _buildLabelItem(LabelEnums v) {
    return ActionItem(
      child: Row(
        children: [
          LabelWidget(
            emptyCircle: true,
            label: v,
          ),
          Text(
            v.getName.tr,
            style: Get.textTheme.bodyMedium,
          ),
        ],
      ),
      onTap: () => setLabel(v),
    );
  }

  void onTapImportance() {
    Get.focusScope?.unfocus();
    Get.dialog(
      AppDialog(
        children: allImportanceEnums.map((v) => _buildImportanceItem(v)).toList(),
      ),
    );
  }

  Widget _buildImportanceItem(ImportanceEnums v) {
    return ActionItem(
      child: Text(
        v.getName.tr,
        style: Get.textTheme.bodyMedium,
      ),
      onTap: () => setImportance(v),
    );
  }
}
