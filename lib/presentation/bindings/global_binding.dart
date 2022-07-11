import 'package:get/get.dart';
import 'package:todo_app/data/local_db/local_db.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalDB>(
      () => LocalDB(),
      fenix: true,
    );
  }
}
