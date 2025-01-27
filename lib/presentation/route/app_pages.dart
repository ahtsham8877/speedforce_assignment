import 'package:get/get.dart';
import 'package:speed_force/presentation/bindings/common_bindings.dart';
import 'package:speed_force/presentation/view/common/auth/view/login_view.dart';
import 'package:speed_force/presentation/view/common/auth/view/sing_in_view.dart';
import 'package:speed_force/presentation/view/dashbord/binding/dashboard_binding.dart';
import 'package:speed_force/presentation/view/dashbord/view/dasboard_view.dart';
import 'package:speed_force/presentation/view/home/home_view/view/home_page.dart';
import 'package:speed_force/presentation/view/splash_screen/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var initialRoute = AppRoutes.splashScreen;
  final appPages = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
        binding: AuthBindings()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginView(),
        binding: AuthBindings()),
    GetPage(
        name: AppRoutes.homepage,
        page: () => ReferralPage(),
        binding: AuthBindings()),
    GetPage(
        name: AppRoutes.singUp,
        page: () => SignInView(),
        binding: AuthBindings()),
    GetPage(
        name: AppRoutes.dashbord,
        page: () => DashboardView(),
        binding: DashboardBinding()),
  ];
}
