import 'package:get/get.dart';
import 'package:luvit/routes/app_routes.dart';

class SplashController extends GetxController {
  Future<void> initialNavigation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await Get.offNamed(AppRoutes.dashboardRoute);
  }
}
