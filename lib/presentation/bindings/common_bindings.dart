import 'package:get/get.dart';
import 'package:speed_force/presentation/view/common/auth/auth_controller/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
  }
}
