import 'package:get/get.dart';
import 'package:luvit/feature/dashboard/presentation/pages/dashboard_page.dart';
import 'package:luvit/feature/splash/presentation/pages/splash_page.dart';
import 'package:luvit/routes/app_routes.dart';

class AppPage {
  static List<GetPage> list = [
    GetPage(name: AppRoutes.splashRoute, page: SplashPage.new),
    GetPage(name: AppRoutes.dashboardRoute, page: DashboardPage.new),
  ];
}
