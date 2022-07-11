import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/file_enums.dart';
import 'package:todo_app/shared/utils/utils.dart';
import 'package:todo_app/shared/widgets/action_item.dart';
import 'package:todo_app/shared/widgets/app_dialog.dart';

Future<FileEnums?> showPickDialog() async {
  final res = await Get.dialog(
    AppDialog(
      children: [
        ActionItem(
          child: _ActionWidget(
            icon: isApple() ? CupertinoIcons.photo : Icons.image_outlined,
            title: StringsKeys.image,
          ),
          onTap: () => Get.back(result: FileEnums.image),
        ),
        ActionItem(
          child: _ActionWidget(
            icon: isApple() ? CupertinoIcons.videocam_circle : Icons.video_camera_back_outlined,
            title: StringsKeys.video,
          ),
          onTap: () => Get.back(result: FileEnums.video),
        ),
      ],
    ),
  );
  return res;
}

class _ActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ActionWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: Icon(
            icon,
            color: Get.textTheme.bodyMedium?.color,
          ),
        ),
        Text(
          title.tr,
          style: Get.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
