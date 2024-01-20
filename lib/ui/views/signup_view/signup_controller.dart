import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/core/data/models/login_info.dart';
import 'package:e_commerce/core/data/repository/auth_repository.dart';
import 'package:e_commerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';
import 'package:e_commerce/ui/views/main_view/main_view.dart';
import 'package:e_commerce/ui/views/signup_view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  String Username = 'Hassan@gmail.com';
  @override
  void onInit() {
    // TODO: implement onInit
    usernameController.text = Username;
    super.onInit();
  }

  void goToLogIn() {
    Get.off(LoginView());
  }

  bool isEmailValid(String value) => isEmailValidReg(value);
  bool isComplexPassword(String value) => isComplexPasswordReg(value);

  void signUbButton() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      Future.delayed(Duration(seconds: 2)).then((value) {
        if (usernameController.text == Username) {
          isLoading.value = false;

          BotToast.showText(text: 'account already exists');
        } else {
          Get.off(MainView());
          isLoading.value = false;
        }
      });
    }
  }
}