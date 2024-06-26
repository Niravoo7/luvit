import 'package:get/get.dart';
import 'package:luvit/injection_container/injection_container_imports.dart';

class InjectableControllers {
  InjectableControllers.inject() {
    Get
      ..lazyPut<SplashController>(SplashController.new, fenix: true)
      ..lazyPut<DashboardController>(DashboardController.new, fenix: true)
      ..lazyPut<HomeController>(HomeController.new, fenix: true);
  }
}
