import 'package:e_commerce/core/translation/app_translation.dart';
import 'package:e_commerce/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  List<String> descriptions = [
    tr("key_introDescriptionItem1"),
    tr("key_introDescriptionItem2"),
    tr("key_introDescriptionItem3")
  ];
  List<String> images = ['Bag', 'Phone', 'Truck'];
  List<String> background_images = ['City', 'Union', 'City'];
  RxInt index = 0.obs;

  void skipButton() {
    index.value = images.length - 1;
  }

  void nextButton() {
    if (index < images.length - 1) {
      index.value++;
    } else
      Get.off(LandingView());
  }
}
