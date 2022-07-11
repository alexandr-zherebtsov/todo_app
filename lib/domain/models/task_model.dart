import 'dart:typed_data';

class TaskModel {
  static const String cId = 'id';
  static const String cTitle = 'title';
  static const String cCreatedAt = 'createdAt';
  static const String cDate = 'date';
  static const String cImportance = 'importance';
  static const String cLabel = 'label';
  static const String cFile = 'file';
  static const String cFileFormat = 'fileFormat';
  static const String cFileAsset = 'fileAsset';

  static const List<String> columns = <String>[
    TaskModel.cId,
    TaskModel.cTitle,
    TaskModel.cCreatedAt,
    TaskModel.cDate,
    TaskModel.cImportance,
    TaskModel.cLabel,
    TaskModel.cFile,
    TaskModel.cFileFormat,
    TaskModel.cFileAsset,
  ];

  int? id;
  String? title;
  int? createdAt;
  int? date;
  String? importance;
  String? label;
  Uint8List? file;
  String? fileFormat;
  String? fileAsset;

  TaskModel({
    this.id,
    this.title,
    this.createdAt,
    this.date,
    this.importance,
    this.label,
    this.file,
    this.fileFormat,
    this.fileAsset,
  });

  TaskModel.fromMap(Map<String, dynamic> json) {
    id = json[cId];
    title = json[cTitle];
    createdAt = json[cCreatedAt];
    date = json[cDate];
    importance = json[cImportance];
    label = json[cLabel];
    file = json[cFile];
    fileFormat = json[cFileFormat];
    fileAsset = json[cFileAsset];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[cId] = id;
    data[cTitle] = title;
    data[cCreatedAt] = createdAt;
    data[cDate] = date;
    data[cImportance] = importance;
    data[cLabel] = label;
    data[cFile] = file;
    data[cFileFormat] = fileFormat;
    data[cFileAsset] = fileAsset;
    return data;
  }
}
