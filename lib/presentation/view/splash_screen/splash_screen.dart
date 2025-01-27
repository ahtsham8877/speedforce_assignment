import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_force/app/app_constant/app_assets.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';

import 'package:speed_force/presentation/view/common/auth/view/login_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => LoginView());
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                AppAssets.logo,
                height: 110,
                width: 334,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppAssets.loading,
                color: AppColors.kPrimary,
                height: 120,
                width: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
