import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  static const double mainBorderRadius = 12;
  static const double secondaryBorderRadius = 32;

  static InputDecoration noBorderTF({
    final String? hintText,
  }) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Get.theme.cardTheme.color,
      border: outlineInputBorder,
      errorBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
    );
  }

  static final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppStyles.mainBorderRadius),
    borderSide: BorderSide.none,
  );
}
