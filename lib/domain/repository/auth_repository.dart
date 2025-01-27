import 'package:speed_force/app/config/api_urls.dart';
import 'package:speed_force/data/api_provider/api_provider.dart';

class AuthRepository {
  final ApiManager _apiManager = ApiManager();

  AuthRepository._privateConstructor();

  static final AuthRepository _instance = AuthRepository._privateConstructor();

  static AuthRepository get instance => _instance;

  factory AuthRepository() {
    return _instance;
  }

  Future<dynamic> getUsers() async {
    return await _apiManager.requestHttpAPi(ApiUrls.loginUrl,
        method: APIMethod.get);
  }
}
