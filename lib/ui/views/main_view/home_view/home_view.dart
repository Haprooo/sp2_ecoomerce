import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/enums/text_style_type.dart';
import 'package:e_commerce/core/translation/app_translation.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: screenWidth(1.5),
            width: screenWidth(1),
            child: Stack(
              children: [
                CarouselSlider(
                  items: controller.imgList.map(
                    (i) {
                      return Container(
                          width: screenWidth(1),
                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                          // decoration: BoxDecoration(color: Colors.amber),
                          child: Image.network(i));
                    },
                  ).toList(),
                  carouselController: controller.carouselController,
                  options: CarouselOptions(
                      height: screenWidth(1.5),
                      autoPlay: true,
                      viewportFraction: 1.0,
                      //enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        controller.index.value = index;
                      }),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: SizedBox(),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Obx(() => DotsIndicator(
                        dotsCount: controller.imgList.length,
                        position: controller.index.value,
                        decorator: DotsDecorator(
                          color: AppColors.whiteColor, // Inactive color
                          activeColor: AppColors.gradientPoint1,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
