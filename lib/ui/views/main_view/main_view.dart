import 'package:sp2_ecoomerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:sp2_ecoomerce/core/enums/bottom_navigation_type.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/favorite_view/favorite_view.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/home_view/home_view.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/main_controller.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/main_view_widgets/bottom_navigation.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/main_view_widgets/side_menu.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/notifications_view/notifications_view.dart';
import 'package:sp2_ecoomerce/ui/views/main_view/setteings_view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({
    super.key,
  });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = Get.put(MainController());

  //File? selectedImage;
  //bool showOption = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
          key: controller.scaffoldkey,
          drawer: SideMenu(),
          bottomNavigationBar: CustomBottomNavigation(
            selectedView: controller.select.value,
            onTap: (selec, index) {
              controller.buttomNavBarClick(selec, index);
            },
          ),
          body: PageView(
            controller: controller.pageController,
            children: [
              HomeView(),
              FavoriteView(),
              NotificationView(),
              SettingView(),
            ],
          )),
    ));
  }
}
