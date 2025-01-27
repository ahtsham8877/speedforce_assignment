import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speed_force/app/app_constant/app_assets.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';

import 'package:speed_force/presentation/global_widget/custom_button.dart';
import 'package:speed_force/presentation/global_widget/custom_text_field.dart';
import 'package:speed_force/presentation/global_widget/snack_bar_taosts.dart';
import 'package:speed_force/presentation/route/app_routes.dart';

import '../auth_controller/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mediaHeight * 0.05),
            Image.asset(
              AppAssets.logo,
              height: mediaHeight * 0.15,
              width: mediaWidth * 0.8,
            ),
            SizedBox(height: mediaHeight * 0.02),
            Form(
              key: controller.loginKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaWidth * 0.05,
                    vertical: mediaHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      "Welcome Back",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.kBlack, fontWeight: FontWeight.w600),
                    )).paddingOnly(
                        top: mediaHeight * 0.02, bottom: mediaHeight * 0.02),
                    CustomTextFormField(
                      hintText: "Enter Email",
                      headerText: "Email",
                      controller: controller.userNameCont,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.kSecondPrimary,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required".tr;
                        }
                        return null;
                      },
                    ),
                    Obx(
                      () => CustomTextFormField(
                        hintText: "********",
                        headerText: "Password",
                        controller: controller.passwordCont,
                        obscureText: controller.isVisible.value,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.kSecondPrimary,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isVisible.toggle();
                            },
                            icon: Icon(
                              controller.isVisible.value
                                  ? Icons.visibility_off_sharp
                                  : Icons.visibility_sharp,
                              color: AppColors.kSecondPrimary,
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: mediaHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.isRemmber.toggle();
                          },
                          child: Container(
                              height: mediaHeight * 0.03,
                              width: mediaHeight * 0.03,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 3, color: Colors.red),
                              ),
                              child: Center(
                                  child: Obx(
                                () => controller.isRemmber.value
                                    ? Text(
                                        "✔️",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )
                                    : SizedBox(),
                              ))),
                        ),
                        SizedBox(width: mediaWidth * 0.03),
                        Text(
                          'Remember me',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.kPrimary,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaHeight * 0.02),
                    Obx(() => controller.loading.value
                        ? customCircularIndicator()
                        : Center(
                            child: CustomButton(
                                height: mediaHeight * 0.055,
                                color: AppColors.kPrimary,
                                text: Text(
                                  "Log in",
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: mediaWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.kWhite),
                                ),
                                onPressed: () {
                                  if (controller.loginKey.currentState!
                                      .validate()) {
                                    controller.login();
                                  }
                                }),
                          ))
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaHeight * 0.02),
            Text(
              'Forgot the password?',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.kRed, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: mediaHeight * 0.02),
            Text(
              'or continue with',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kGrey, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: mediaHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  AppAssets.facebook,
                  height: mediaHeight * 0.02,
                  width: mediaHeight * 0.02,
                ),
                Image.asset(
                  AppAssets.google,
                  height: mediaHeight * 0.02,
                  width: mediaHeight * 0.02,
                ),
              ],
            ),
            SizedBox(height: mediaHeight * 0.02),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.singUp);
              },
              child: RichText(
                text: TextSpan(
                  text: "signup from here? ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "signUp",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
