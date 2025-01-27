import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';
import 'package:speed_force/presentation/global_widget/custom_button.dart';
import 'package:speed_force/presentation/global_widget/custom_drop_down.dart';
import 'package:speed_force/presentation/global_widget/custom_text_field.dart';
import 'package:speed_force/presentation/global_widget/snack_bar_taosts.dart';
import 'package:speed_force/presentation/route/app_routes.dart';
import 'package:speed_force/presentation/view/common/auth/auth_controller/auth_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:speed_force/presentation/view/common/auth/widgets/customer_provider_btn.dart';

import '../../../../../app/app_constant/app_assets.dart';

class SignInView extends GetView<AuthController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.kBlack),
          backgroundColor: AppColors.kWhite,
          title: Text(
            "Create Account",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.signUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerProviderBtn(),
                SizedBox(height: mediaHeight * 0.02),
                CustomTextFormField(
                  hintText: "Enter First name",
                  controller: controller.firstNameCont,
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field required";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: "Enter Last name",
                  controller: controller.lastNameCont,
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field required";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: "Enter email",
                  controller: controller.emailCont,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        !GetUtils.isEmail(value)) {
                      return "Please enter a valid email";
                    } else if (value!.isEmpty) {
                      return "This field required";
                    }
                    return null;
                  },
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: "Select Gender",
                    selectedValue: controller.selectedGender.value,
                    items: controller.genderOptions.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.selectedGender.value = newValue;
                      }
                    },
                  ),
                ).paddingOnly(bottom: 20),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0), // adjust as needed
                    hintText: 'Enter your phone number', // Customize as needed
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.kGrey),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.kGrey),
                    errorStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.red, fontSize: 11.0),
                    errorMaxLines: 3,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {
                    controller.phoneNumber.value = phone.completeNumber;
                  },
                  validator: (value) {
                    if (controller.phoneNumber.value.isEmpty) {
                      return "Phone number is required";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: "Enter password",
                  controller: controller.spasswordCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field required";
                    }
                    if (value.length < 8) {
                      return "Password length must be 8";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: "Confirm Password",
                  controller: controller.confirmPasswordCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field required";
                    }
                    if (value != controller.spasswordCont.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: "By continuing you agree to our",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: " Terms of Service and Privacy Policy",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.kBlack,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? customCircularIndicator()
                      : CustomButton(
                          color: AppColors.kPrimary,
                          text: Text(
                            "Save",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.kWhite),
                          ),
                          onPressed: () {
                            if (controller.signUpKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                        ).paddingSymmetric(vertical: 20.0),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.login);
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already Have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: " Log In",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.kSecondPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mediaHeight * 0.02),
                Center(
                  child: Text(
                    'or continue with',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.kGrey, fontWeight: FontWeight.w500),
                  ),
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
              ],
            ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
          ),
        ),
      ),
    );
  }
}
