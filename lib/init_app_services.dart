import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'data/local_storage/auth_service.dart';


Future<void> initAppServices() async {
  print("initApp Services Started");
  await GetStorage.init();
  await Get.putAsync(() => AuthService().init());
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  print("initApp Services Finished...");
}
