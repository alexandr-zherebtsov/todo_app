import 'package:get/get.dart';
import 'package:todo_app/presentation/bindings/create_task_binding.dart';
import 'package:todo_app/presentation/bindings/home_binding.dart';
import 'package:todo_app/presentation/bindings/splash_binding.dart';
import 'package:todo_app/presentation/bindings/task_binding.dart';
import 'package:todo_app/presentation/router/routes.dart';
import 'package:todo_app/presentation/ui/create_task/create_task_screen.dart';
import 'package:todo_app/presentation/ui/home/home_screen.dart';
import 'package:todo_app/presentation/ui/splash/splash_screen.dart';
import 'package:todo_app/presentation/ui/task/task_screen.dart';

class AppRouter {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.task,
      page: () => const TaskScreen(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: AppRoutes.createTask,
      page: () => const CreateTaskScreen(),
      binding: CreateTaskBinding(),
    ),
  ];
}
