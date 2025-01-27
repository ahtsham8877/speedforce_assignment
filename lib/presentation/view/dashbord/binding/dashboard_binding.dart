import 'package:get/get.dart';
import 'package:speed_force/presentation/view/common/auth/auth_controller/auth_controller.dart';
import 'package:speed_force/presentation/view/dashbord/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

initializeController() {
  Get.put(AuthController());
}
