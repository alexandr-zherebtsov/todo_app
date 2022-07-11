import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:todo_app/presentation/bindings/global_binding.dart';
import 'package:todo_app/presentation/router/router.dart';
import 'package:todo_app/presentation/router/routes.dart';
import 'package:todo_app/shared/constants/app_values.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/core/localization/translations.dart';
import 'package:todo_app/shared/styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        navigatorKey: Get.key,
        getPages: AppRouter.routes,
        initialRoute: AppRoutes.splash,
        title: StringsKeys.todo.tr,
        initialBinding: GlobalBinding(),
        translations: AppTranslations(),
        locale: const Locale(AppValues.lcEN),
        theme: AppThemes.getTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
