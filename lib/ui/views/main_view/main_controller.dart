import 'package:e_commerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerce/core/enums/bottom_navigation_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  Rx<BottomNavigationEnum> select = BottomNavigationEnum.HOME.obs;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    SharedPrefrenceRepository().setLoggedIn(true);
    super.onInit();
  }

  void buttomNavBarClick(selec, index) {
    select.value = selec;

    pageController.jumpToPage(index);
  }
}
