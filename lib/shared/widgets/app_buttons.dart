import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:todo_app/shared/utils/utils.dart';

class AppMainButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final EdgeInsets margin;

  const AppMainButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: MaterialButton(
        height: 60,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        color: Get.theme.floatingActionButtonTheme.backgroundColor,
        shape: Get.theme.buttonTheme.shape,
        onPressed: onPressed,
        child: Text(
          title.tr.toUpperCase(),
          style: Get.textTheme.labelMedium,
        ),
      ),
    );
  }
}

class SmallIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final String message;
  final Color? backgroundColor;
  final double size;
  final Color iconColor;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const SmallIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.message,
    this.size = 22,
    this.backgroundColor,
    this.iconColor = AppColors.white,
    this.padding = const EdgeInsets.all(8),
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Tooltip(
        message: message.tr,
        child: MaterialButton(
          minWidth: 10,
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          padding: EdgeInsets.zero,
          color: backgroundColor ?? Get.theme.primaryColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Padding(
            padding: padding,
            child: Icon(
              icon,
              size: size,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}


class AppBackButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;

  const AppBackButton({
    Key? key,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: StringsKeys.back.tr,
      icon: Icon(
        isApple() ? CupertinoIcons.back : Icons.arrow_back,
        color: color,
      ),
      onPressed: onTap ?? Get.back,
    );
  }
}

class AppFloatActionButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const AppFloatActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: AppColors.white,
      ),
    );
  }
}
