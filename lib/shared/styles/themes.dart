import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:todo_app/shared/styles/styles.dart';

class AppThemes {
  static ThemeData getTheme() => light;

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primary,
    dividerColor: AppColors.lightGrey,
    scaffoldBackgroundColor: AppColors.white,
    dialogTheme: DialogTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.secondaryBorderRadius),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      shape: CircleBorder(),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.secondaryBorderRadius),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 0,
      color: AppColors.whiteWithBlue2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.mainBorderRadius),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      color: AppColors.whiteWithBlue1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.mainBorderRadius),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 9,
        horizontal: 16,
      )
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      shadowColor: AppColors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 20,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
    ),
  );
}
