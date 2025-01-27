import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';
import 'package:speed_force/presentation/view/common/auth/auth_controller/auth_controller.dart';

class CustomerProviderBtn extends GetView<AuthController> {
  const CustomerProviderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: screenWidth * 0.8, // 80% of the screen width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.kWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(2, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First container
                Obx(() => GestureDetector(
                      onTap: () {
                        controller.isFirstSelected.value = true;
                      },
                      child: Container(
                        width: screenWidth * 0.35, // 35% of the screen width
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015, // Responsive padding
                        ),
                        decoration: BoxDecoration(
                          color: controller.isFirstSelected.value
                              ? AppColors.kPrimary
                              : AppColors.kWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Consumer",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: controller.isFirstSelected.value
                                      ? AppColors.kWhite
                                      : AppColors.kPrimary, // Change text color
                                ),
                          ),
                        ),
                      ),
                    )),

                // Second container
                Obx(() => GestureDetector(
                      onTap: () {
                        controller.isFirstSelected.value = false;
                      },
                      child: Container(
                        width: screenWidth * 0.35, // 35% of the screen width
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015, // Responsive padding
                        ),
                        decoration: BoxDecoration(
                          color: controller.isFirstSelected.value
                              ? AppColors.kWhite
                              : AppColors.kPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Service Provider",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: controller.isFirstSelected.value
                                      ? AppColors.kPrimary
                                      : AppColors.kWhite, // Change text color
                                ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
