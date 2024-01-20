import 'package:bot_toast/bot_toast.dart';
import 'package:sp2_ecoomerce/core/data/models/login_info.dart';
import 'package:sp2_ecoomerce/core/data/repository/auth_repository.dart';
import 'package:sp2_ecoomerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:sp2_ecoomerce/ui/shared/utils.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/main_view.dart';
import 'package:sp2_ecoomerce/ui/views/signup_view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController =
      TextEditingController(text: "mor_2314");
  TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  // String Username = 'Hassan@gmail.com';
  // String Password = 'P@ssw0rd';
  void checkfunction() {}

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    LoginInfo user = SharedPrefrenceRepository().getlogininfo();

    if (user.isCheked!) {
      isChecked.value = true;
      usernameController.text = user.username!;
      passwordController.text = user.password!;
    }
    super.onInit();
  }

  void goToSignUp() {
    Get.off(SignUpView());
  }

  bool isEmailValid(String value) => isEmailValidReg(value);
  bool isComplexPassword(String value) => isComplexPasswordReg(value);

  void login_button() {
    if (!formKey.currentState!.validate()) {
      //API request

      isLoading.value = true;

      AuthRepository()
          .login(
              username: usernameController.text,
              password: passwordController.text)
          .then((value) => value.fold((l) => BotToast.showText(text: l), (r) {
                if (isChecked.value) {
                  LoginInfo logininfo = LoginInfo(
                      username: usernameController.text,
                      password: passwordController.text,
                      isCheked: true);
                  SharedPrefrenceRepository().setlogininfo(logininfo);
                }
                SharedPrefrenceRepository().settokeninfo(r);
                BotToast.showText(text: r.token.toString());
                Get.off(MainView());
              }));
    }
  }
}
