import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/constants/app_values.dart';
import 'package:todo_app/shared/styles/colors.dart';

enum LabelEnums {
  yellow,
  orange,
  turquoise,
  purple,
  pink,
  green,
  aquamarine,
  heliotrope,
  blue,
  red,
  none,
}

const List<LabelEnums> allLabelEnums = <LabelEnums>[
  LabelEnums.none,
  LabelEnums.yellow,
  LabelEnums.orange,
  LabelEnums.turquoise,
  LabelEnums.purple,
  LabelEnums.pink,
  LabelEnums.green,
  LabelEnums.aquamarine,
  LabelEnums.heliotrope,
  LabelEnums.blue,
  LabelEnums.red,
];

const Map<String, LabelEnums> mapLabelEnums = <String, LabelEnums> {
  AppValues.labYellow: LabelEnums.yellow,
  AppValues.labOrange: LabelEnums.orange,
  AppValues.labTurquoise: LabelEnums.turquoise,
  AppValues.labPurple: LabelEnums.purple,
  AppValues.labPink: LabelEnums.pink,
  AppValues.labGreen: LabelEnums.green,
  AppValues.labAquamarine: LabelEnums.aquamarine,
  AppValues.labHeliotrope: LabelEnums.heliotrope,
  AppValues.labBlue: LabelEnums.blue,
  AppValues.labRed: LabelEnums.red,
  AppValues.none: LabelEnums.none,
};

extension LabelEnumsX on LabelEnums {
  String get name => describeEnum(this);

  String get getName {
    switch (this) {
      case LabelEnums.yellow:
        return AppValues.labYellow;
      case LabelEnums.orange:
        return AppValues.labOrange;
      case LabelEnums.turquoise:
        return AppValues.labTurquoise;
      case LabelEnums.purple:
        return AppValues.labPurple;
      case LabelEnums.pink:
        return AppValues.labPink;
      case LabelEnums.green:
        return AppValues.labGreen;
      case LabelEnums.aquamarine:
        return AppValues.labAquamarine;
      case LabelEnums.heliotrope:
        return AppValues.labHeliotrope;
      case LabelEnums.blue:
        return AppValues.labBlue;
      case LabelEnums.red:
        return AppValues.labRed;
      default:
        return AppValues.none;
    }
  }

  Color get getColor {
    switch (this) {
      case LabelEnums.yellow:
        return AppColors.labYellow;
      case LabelEnums.orange:
        return AppColors.labOrange;
      case LabelEnums.turquoise:
        return AppColors.labTurquoise;
      case LabelEnums.purple:
        return AppColors.labPurple;
      case LabelEnums.pink:
        return AppColors.labPink;
      case LabelEnums.green:
        return AppColors.labGreen;
      case LabelEnums.aquamarine:
        return AppColors.labAquamarine;
      case LabelEnums.heliotrope:
        return AppColors.labHeliotrope;
      case LabelEnums.blue:
        return AppColors.labBlue;
      case LabelEnums.red:
        return AppColors.labRed;
      default:
        return AppColors.transparent;
    }
  }
}
