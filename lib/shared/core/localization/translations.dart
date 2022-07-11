import 'package:get/get.dart';
import 'package:todo_app/shared/constants/app_values.dart';
import 'package:todo_app/shared/core/localization/languages/en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    AppValues.lcEN: en,
  };
}
