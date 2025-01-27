import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:speed_force/domain/repository/auth_repository.dart';
import 'package:speed_force/presentation/global_widget/custom_snackbar.dart';
import 'package:speed_force/presentation/global_widget/snack_bar_taosts.dart';
import 'package:speed_force/presentation/model/user_model.dart';
import 'package:speed_force/presentation/route/app_routes.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final loginKey = GlobalKey<FormState>();
  final userNameCont = TextEditingController();
  final passwordCont = TextEditingController();

  //sign in
  final signUpKey = GlobalKey<FormState>();

  final firstNameCont = TextEditingController();
  final lastNameCont = TextEditingController();
  final emailCont = TextEditingController();
  final spasswordCont = TextEditingController();
  final confirmPasswordCont = TextEditingController();

  // Gender options and state management
  final genderOptions = ["Male", "Female", "Other"].obs;
  final selectedGender = Rx<String>("");

  final isLoading = false.obs;
  final loading = false.obs;
  final isVisible = true.obs;
  final isRemmber = true.obs;
  final phoneNumber = ''.obs;

  final userModel = <UserModel>[].obs;

  RxBool isFirstSelected = false.obs;

  final String validEmail = "user@speedforce.com";
  final String validPassword = "password";

  Future<void> login() async {
    final email = userNameCont.text.trim();
    final password = passwordCont.text;

    if (!GetUtils.isEmail(email)) {
      customToastView(title: "Please enter a valid email address.");
      return;
    }
    if (password.isEmpty || password.length < 6) {
      customToastView(title: "Password must be at least 6 characters long.");
      return;
    }

    loading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    if (email == validEmail && password == validPassword) {
      loading.value = false;
      await getUserData();
      Get.offAllNamed(AppRoutes.dashbord);
    } else {
      loading.value = false;
      failedSnackBar(
        title: "Login Failed!",
        message: "The provided credentials are incorrect.",
      );
    }
  }

  Future<void> getUserData() async {
    loading.value = true;
    await AuthRepository.instance.getUsers().then((value) {
      if (value != null) {
        final resStr = jsonDecode(value);

        if (resStr['status'] == "success") {
          UserModel user = UserModel.fromJson(resStr);
          userModel.value = [user];
        } else {
          failedSnackBar(
            title: "Error",
            message: "Failed to fetch user data",
          );
        }
      }
    }).catchError((error) {
      failedSnackBar(
        title: "Error",
        message: "An error occurred: $error",
      );
    });
    loading.value = false;
  }

  // Registration logic
  Future<void> register() async {
    if (signUpKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        await Future.delayed(const Duration(seconds: 2));
        isLoading.value = false;
        await getUserData();
        Get.offAllNamed(AppRoutes.dashbord);
        successSnackBar(
          title: "Registration Successful",
          message:
              "Welcome, ${firstNameCont.text} ${lastNameCont.text}, Gender: ${selectedGender.value}!",
        );
      } catch (error) {
        isLoading.value = false;
        failedSnackBar(
          title: "Registration Failed",
          message: error.toString(),
        );
      }
    }
  }

  @override
  void dispose() {
    firstNameCont.dispose();
    lastNameCont.dispose();
    emailCont.dispose();
    spasswordCont.dispose();
    confirmPasswordCont.dispose();
    super.dispose();
  }
}
