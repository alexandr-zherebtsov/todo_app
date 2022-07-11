import 'package:get/get.dart';
import 'package:todo_app/data/local_db/local_db.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/repositories/task_repository_impl.dart';
import 'package:todo_app/presentation/ui/task/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TackRepository>(
      () => TackRepositoryImpl(
        Get.find<LocalDB>(),
      ),
      fenix: true,
    );
    Get.put(
      TaskController(
        Get.find<TackRepository>(),
      ),
    );
  }
}
