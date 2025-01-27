import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speed_force/presentation/route/app_routes.dart';

class AuthService extends GetxService {
  static AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;

  static bool isLoggedIn = false;

  final apiToken = "".obs;
  late GetStorage _box;

  AuthService._internal() {
    _box = GetStorage();
  }

  Future<AuthService> init() async {
    print("Initializing AuthService...");

    await getCurrentUser();
    return this;
  }

  // Fetches the current user and token from local storage
  Future<void> getCurrentUser() async {
    apiToken.value = _box.read('token') ?? "";
    if (_box.hasData('user')) {
      final userJson = await _box.read('user');

      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
    print("Is LOGED IN $isLoggedIn");
  }

  // Set and save API token
  void setToken(String token) {
    _box.write('token', token);
    apiToken.value = token;
  }

  // Set and save current user
  void setCurrentUser(String userJson) {
    isLoggedIn = true;
    _box.write('user', userJson);
  }

  // Optional method to log out user by clearing all relevant data
  logout() {
    _box.remove('token');
    _box.remove('user');
    apiToken.value = "";

    isLoggedIn = false;
    Get.offAllNamed(AppRoutes.login);
  }
}
