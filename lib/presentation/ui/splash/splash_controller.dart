import 'package:get/get.dart';
import 'package:todo_app/data/local_db/local_db.dart';
import 'package:todo_app/presentation/router/routes.dart';
import 'package:todo_app/shared/utils/utils.dart';

class SplashController extends GetxController {
  final LocalDB _db;

  SplashController(this._db);

  @override
  void onInit() async {
    super.onInit();
    await delayedFunc(milliseconds: 800);
    await _db.init();
    goHome();
  }

  void goHome() => Get.offAllNamed(AppRoutes.home);
}
