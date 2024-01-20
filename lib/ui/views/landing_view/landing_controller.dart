import 'package:sp2_ecoomerce/app/my_app.dart';
import 'package:sp2_ecoomerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:sp2_ecoomerce/ui/views/login_view/login_view.dart';
import 'package:sp2_ecoomerce/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    SharedPrefrenceRepository().setFirstLunch(false);
    super.onInit();
  }

  void login_button() {
    Get.to(LoginView());
  }

  void signup_button() {
    Get.to(SignUpView());
  }

  void changeLanguage(String code) {
    SharedPrefrenceRepository().setAppLanguage(code);
    Get.updateLocale(getLocal());
  }
}
