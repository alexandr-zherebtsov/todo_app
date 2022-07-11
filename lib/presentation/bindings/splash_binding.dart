import 'package:get/get.dart';
import 'package:todo_app/data/local_db/local_db.dart';
import 'package:todo_app/presentation/ui/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(
        Get.find<LocalDB>(),
      ),
    );
  }
}
