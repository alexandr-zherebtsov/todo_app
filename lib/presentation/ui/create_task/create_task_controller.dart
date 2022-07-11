import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/models/task_model.dart';
import 'package:todo_app/presentation/ui/create_task/widgets/pick_dialog.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/enums/file_enums.dart';
import 'package:todo_app/shared/enums/importance_enums.dart';
import 'package:todo_app/shared/enums/label_enums.dart';
import 'package:todo_app/shared/enums/screen_enums.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:todo_app/shared/utils/date_utils.dart';
import 'package:todo_app/shared/utils/utils.dart';

class CreateTaskController extends GetxController {
  final TackRepository _tr;
  final ImagePicker _picker;

  CreateTaskController(
    this._tr,
    this._picker,
  );

  ScreenEnums popResult = ScreenEnums.none;

  ScreenEnums _screenEnum = ScreenEnums.none;
  ScreenEnums get screenEnum => _screenEnum;
  set screenEnum(ScreenEnums v) {
    _screenEnum = v;
    update();
  }

  final TextEditingController descriptionTC = TextEditingController();
  final FocusNode descriptionFN = FocusNode();

  Rx<DateTime> date = DateTime.now().obs;
  LabelEnums label = LabelEnums.none;
  ImportanceEnums importance = ImportanceEnums.medium;
  Uint8List? file;
  String? fileFormat;
  String? fileAsset;

  late final int? id;
  TaskModel? task;

  @override
  void onInit() async {
    super.onInit();
    screenEnum = ScreenEnums.loading;
    id = Get.arguments as int?;
    if (id != null) {
      await getTask();
      setData();
    }
    screenEnum = ScreenEnums.loaded;
    if (id != null && task == null) {
      screenEnum = ScreenEnums.error;
    }
  }

  Future<void> getTask() async => task = await _tr.getTask(id!);

  void setData() {
    if (task != null) {
      descriptionTC.text = task!.title ?? '';
      date(dateFromMilliseconds(task!.date) ?? DateTime.now());
      label = mapLabelEnums[task!.label] ?? LabelEnums.none;
      importance = mapImportanceEnums[task!.importance] ?? ImportanceEnums.medium;
      file = task!.file;
      fileFormat = task!.fileFormat;
      fileAsset = task!.fileAsset;
    }
  }

  void setLabel(final LabelEnums v) {
    Get.back();
    label = v;
    update();
  }

  void setImportance(final ImportanceEnums v) {
    Get.back();
    importance = v;
    update();
  }

  void onTapSave() async {
    unFocus();
    final bool res;
    if (descriptionTC.text.trim().isEmpty) {
      res = false;
    } else {
      if (id == null) {
        res = await createTask();
      } else {
        res = await editTask();
      }
    }
    if (res) {
      popResult = ScreenEnums.refresh;
      toast(StringsKeys.done.tr);
      pop();
    } else {
      toast(StringsKeys.somethingWentWrong.tr);
    }
  }

  Future<bool> createTask() async {
    final bool vid = isVideo();
    final TaskModel? res = await _tr.insertTask(
      TaskModel(
        id: generateId(),
        title: descriptionTC.text.trim(),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        date: date.value.millisecondsSinceEpoch,
        importance: importance.getName,
        label: label.getName,
        file: vid ? null : file,
        fileFormat: vid ? null : fileFormat,
        fileAsset: vid ? null : fileAsset,
      ),
    );
    return res != null;
  }

  Future<bool> editTask() async {
    final bool vid = isVideo();
    final TaskModel? res = await _tr.updateTack(
      TaskModel(
        id: task!.id,
        title: descriptionTC.text.trim(),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        date: date.value.millisecondsSinceEpoch,
        importance: importance.getName,
        label: label.getName,
        file: vid ? null : file,
        fileFormat: vid ? null : fileFormat,
        fileAsset: vid ? null : fileAsset,
      ),
    );
    return res != null;
  }

  void attachFile() async {
    XFile? res;
    final FileEnums? type = await showPickDialog();
    if (type == FileEnums.image) {
      res = await _picker.pickImage(source: ImageSource.gallery);
    } else if (type == FileEnums.video) {
      res = await _picker.pickVideo(source: ImageSource.gallery);
    }
    if (res != null) {
      file = await res.readAsBytes();
      fileFormat = getFormatFromName(res.name);
      fileAsset = res.path;
      update();
    }
  }

  void removeFile() {
    file = null;
    fileFormat = null;
    fileAsset = null;
    update();
  }

  void unFocus() => descriptionFN.unfocus();

  Future<bool> pop() async {
    Get.back(result: popResult);
    return true;
  }

  bool isVideo() {
    final bool res = mapFileEnums[fileFormat] == FileEnums.video;
    if (res) {
      showOverlayNotification(
        (_) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            child: Material(
              shape: Get.theme.cardTheme.shape,
              color: AppColors.red,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: Text(
                  'Video unsupported for now',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return res;
  }
}
