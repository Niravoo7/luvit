import 'package:get/get.dart';
import 'package:luvit/feature/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:luvit/feature/home/presentation/controller/home_controller.dart';
import 'package:luvit/injection_container/injection_container_imports.dart';

class InjectableControllers {
  InjectableControllers.inject() {
    Get
      ..lazyPut<SplashController>(
        SplashController.new,
        fenix: true,
      )
      ..lazyPut<DashboardController>(
        DashboardController.new,
        fenix: true,
      )
      ..lazyPut<HomeController>(
        () => HomeController(
          getCardUC: Get.find(),
        ),
        fenix: true,
      );
  }
}
