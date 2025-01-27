import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speed_force/presentation/route/app_pages.dart';
import 'package:speed_force/presentation/view/common/auth/view/login_view.dart';
import 'package:speed_force/presentation/view/dashbord/binding/dashboard_binding.dart';
import 'package:speed_force/presentation/view/home/home_view/view/home_page.dart';
import 'package:speed_force/presentation/view/splash_screen/splash_screen.dart';

import 'app/app_constant/app_theme.dart';
import 'init_app_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppServices();
  initializeController();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.getTheme(Brightness.light),
      darkTheme: AppThemes.getTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      // home: ReferralPage(),
      initialRoute: AppPages.initialRoute,
      getPages: AppPages().appPages,
    );
  }
}
