import 'package:e_commerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerce/ui/views/intro_view/intro_view.dart';
import 'package:e_commerce/ui/views/landing_view/landing_view.dart';
import 'package:e_commerce/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(Duration(seconds: 2)).then((value) {
      whereto();
    });
    super.onInit();
  }

  whereto() {
    print('hello');
    SharedPrefrenceRepository().getFirstLunch()
        ? Get.off(IntroView())
        : SharedPrefrenceRepository().getLoggedIn()
            ? Get.off(MainView())
            : Get.off(LandingView());
  }
}
