import 'package:todo_app/shared/constants/app_values.dart';
import 'package:flutter/foundation.dart';

enum ImportanceEnums {
  highest,
  high,
  medium,
  low,
  lowest,
  none,
}

const List<ImportanceEnums> allImportanceEnums = <ImportanceEnums>[
  ImportanceEnums.highest,
  ImportanceEnums.high,
  ImportanceEnums.medium,
  ImportanceEnums.low,
  ImportanceEnums.lowest,
];

const Map<String, ImportanceEnums> mapImportanceEnums = <String, ImportanceEnums> {
  AppValues.impHighest: ImportanceEnums.highest,
  AppValues.impHigh: ImportanceEnums.high,
  AppValues.impMedium: ImportanceEnums.medium,
  AppValues.impLow: ImportanceEnums.low,
  AppValues.impLowest: ImportanceEnums.lowest,
  AppValues.none: ImportanceEnums.none,
};

extension ImportanceEnumsX on ImportanceEnums {
  String get name => describeEnum(this);

  String get getName {
    switch (this) {
      case ImportanceEnums.highest:
        return AppValues.impHighest;
      case ImportanceEnums.high:
        return AppValues.impHigh;
      case ImportanceEnums.medium:
        return AppValues.impMedium;
      case ImportanceEnums.low:
        return AppValues.impLow;
      case ImportanceEnums.lowest:
        return AppValues.impLowest;
      default:
        return AppValues.none;
    }
  }
}
