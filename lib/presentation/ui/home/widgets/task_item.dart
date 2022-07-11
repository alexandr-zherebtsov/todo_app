import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/models/task_model.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/importance_enums.dart';
import 'package:todo_app/shared/enums/label_enums.dart';
import 'package:todo_app/shared/utils/date_utils.dart';
import 'package:todo_app/shared/utils/utils.dart';
import 'package:todo_app/shared/widgets/task_status.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final void Function({int? id}) edit;
  final void Function({int? id}) delete;
  final void Function({int? id}) onTapItem;
  final bool bottomMargin;
  final bool hideDate;

  const TaskItem({
    Key? key,
    required this.task,
    required this.edit,
    required this.delete,
    required this.onTapItem,
    this.bottomMargin = false,
    this.hideDate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Offstage(
          offstage: hideDate,
          child: _buildDateSeparator(task),
        ),
        Padding(
          padding: bottomMargin ? const EdgeInsets.only(
            bottom: 100,
          ) : EdgeInsets.zero,
          child: Card(
            child: InkWell(
              onTap: () => onTapItem(id: task.id),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 8,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Text(
                                task.title ?? '',
                                style: Get.textTheme.bodyLarge,
                              ),
                            ),
                            TackStatus(
                              label: mapLabelEnums[task.label] ?? LabelEnums.none,
                              importance: mapImportanceEnums[task.importance] ?? ImportanceEnums.none,
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildPopUp(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateSeparator(final TaskModel task) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 20,
      ),
      child: Text(
        getDateYT(task.date),
        style: Get.textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildPopUp() {
    return PopupMenuButton(
      tooltip: StringsKeys.more.tr,
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (_) {
        return [
          _popUpItem(
            title: StringsKeys.edit,
            icon: isApple() ? Icons.mode_edit_outlined : Icons.edit,
            onTap: () {
              edit(id: task.id);
            },
          ),
          _popUpItem(
            title: StringsKeys.delete,
            icon: isApple() ? CupertinoIcons.delete : Icons.delete_outline,
            onTap: () => delete(id: task.id),
          ),
        ];
      }
    );
  }

  PopupMenuItem _popUpItem({
    required final String title,
    required final IconData icon,
    required final void Function() onTap,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: Icon(
              icon,
            ),
          ),
          Text(
            title.tr,
          ),
        ],
      ),
    );
  }
}
