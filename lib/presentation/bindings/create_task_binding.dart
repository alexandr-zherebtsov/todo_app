import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/data/local_db/local_db.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/repositories/task_repository_impl.dart';
import 'package:todo_app/presentation/ui/create_task/create_task_controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TackRepository>(
      () => TackRepositoryImpl(
        Get.find<LocalDB>(),
      ),
      fenix: true,
    );
    Get.put(
      CreateTaskController(
        Get.find<TackRepository>(),
        ImagePicker(),
      ),
    );
  }
}
