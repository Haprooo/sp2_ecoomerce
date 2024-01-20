import 'package:sp2_ecoomerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:sp2_ecoomerce/ui/views/intro_view/intro_view.dart';
import 'package:sp2_ecoomerce/ui/views/landing_view/landing_view.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/main_view.dart';
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
