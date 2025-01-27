import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';
import 'package:speed_force/presentation/view/home/home_view/view/home_page.dart';
import 'package:speed_force/presentation/view/home/home_view/view/user_profile.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();
  final selectedIndex = 0.obs;
  DateTime? lastPressed;
  final navigatorKeys = List.generate(4, (_) => GlobalKey<NavigatorState>());

  final widgetsList = [
    ReferralPage(),
    Container(),
    Container(),
    UserProfile(),
  ];

  onWillPop() async {
    final currentNavigatorState =
        navigatorKeys[selectedIndex.value].currentState;

    if (currentNavigatorState != null && currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    }

    if (selectedIndex.value != 0) {
      selectedIndex.value = 0;
      return false;
    }

    DateTime now = DateTime.now();
    if (lastPressed == null ||
        now.difference(lastPressed!) > const Duration(seconds: 2)) {
      lastPressed = now;
      Fluttertoast.showToast(
        msg: "Press back again to exit",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.kWhite,
        textColor: AppColors.kBlack,
        fontSize: 16.0,
      );
      return false;
    }
    return true;
  }
}
