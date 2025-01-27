import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_force/app/app_constant/app_assets.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';
import 'package:speed_force/presentation/view/dashbord/controller/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop();
      },
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: List.generate(
              controller.widgetsList.length,
              (index) => Navigator(
                key: controller.navigatorKeys[index],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (_) => controller.widgetsList[index],
                  );
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: AppColors.kPrimary,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.white10,
            ),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            selectedItemColor: AppColors.kWhite,
            unselectedItemColor: AppColors.kWhite.withOpacity(0.7),
            showUnselectedLabels: true,
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              if (controller.selectedIndex.value != index) {
                controller.selectedIndex.value = index;
              } else {
                // Reset to the root of the current tab
                controller.navigatorKeys[index].currentState?.popUntil(
                  (route) => route.isFirst,
                );
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.badge_outlined),
                label: "Jobs",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.money_rounded),
                label: " Earnings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
