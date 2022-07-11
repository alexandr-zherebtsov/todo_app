import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/ui/splash/splash_controller.dart';
import 'package:todo_app/shared/styles/icons.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Image.asset(
            AppIcons.appIcon,
            width: 110,
            height: 110,
          ),
        ),
      ),
    );
  }
}
