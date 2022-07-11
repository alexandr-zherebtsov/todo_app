import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/file_enums.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:todo_app/shared/styles/styles.dart';
import 'package:todo_app/shared/utils/utils.dart';
import 'package:todo_app/shared/widgets/app_buttons.dart';
import 'package:todo_app/shared/widgets/video_player.dart';

class FileWidget extends StatelessWidget {
  final Uint8List? file;
  final String? fileFormat;
  final String? fileAsset;
  final void Function()? remove;

  const FileWidget({
    Key? key,
    required this.file,
    required this.fileFormat,
    required this.fileAsset,
    this.remove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return file == null ? const Offstage() : Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          constraints: const BoxConstraints(
            minWidth: 300,
            minHeight: 300,
          ),
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(AppStyles.mainBorderRadius),
          ),
          child: AspectRatio(
            aspectRatio: 4 / 4,
            child: _buildFile(),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Offstage(
            offstage: remove == null,
            child: SmallIconButton(
              size: 18,
              iconColor: AppColors.white,
              backgroundColor: AppColors.red,
              message: StringsKeys.delete.tr,
              icon: isApple() ? CupertinoIcons.delete : Icons.delete_outline,
              margin: const EdgeInsets.only(
                top: 4,
                right: 4,
              ),
              onPressed: remove,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFile() {
    switch(mapFileEnums[getFileFormat(
      format: fileFormat,
      file: file,
    )]) {
      case FileEnums.image:
        return _buildImage();
      case FileEnums.video:
        return AppVideoPlayer(
          asset: fileAsset!,
        );
      default:
        return const Offstage();
    }
  }

  Widget _buildImage() {
    return Image.memory(
      file!,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.none,
    );
  }
}
