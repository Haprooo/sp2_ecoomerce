import 'package:dots_indicator/dots_indicator.dart';
import 'package:sp2_ecoomerce/core/enums/text_style_type.dart';
import 'package:sp2_ecoomerce/core/translation/app_translation.dart';
import 'package:sp2_ecoomerce/ui/shared/colors.dart';
import 'package:sp2_ecoomerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:sp2_ecoomerce/ui/shared/utils.dart';
import 'package:sp2_ecoomerce/ui/views/intro_view/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: screenWidth(1),
              height: screenWidth(10),
              color: AppColors.gradientPoint1,
            ),
            FittedBox(
              child: Image.asset(
                'assets/images/pngs/umberella.png',
                width: screenWidth(1) * 1.25,
                height: screenWidth(3),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: screenWidth(1),
              height: screenWidth(5),
            ),
            Obx(
              () => CustomText(
                text: controller.descriptions[controller.index.value],
                type: TextStyleType.CUSTOM,
                fontFamily: 'Roboto',
                textweight: FontWeight.w400,
                textSize: screenWidth(25),
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            SizedBox(
              width: screenWidth(1),
              height: screenWidth(1),
              child: Stack(
                children: [
                  Obx(
                    () => Image.asset(
                      'assets/images/pngs/${controller.background_images[controller.index.value]}.png',
                      opacity: controller.index == 1
                          ? const AlwaysStoppedAnimation(.15)
                          : const AlwaysStoppedAnimation(1),
                      fit: BoxFit.fill,
                      width: screenWidth(1),
                      height: screenWidth(2),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      width: screenWidth(1),
                      height: screenWidth(2),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        AppColors.gradientPoint1,
                        AppColors.gradientPoint2,
                        AppColors.gradientPoint3
                      ])),
                    ),
                  ),
                  PositionedDirectional(
                      top: screenWidth(30),
                      start: screenWidth(5),
                      child: Obx(
                        () => Image.asset(
                            'assets/images/pngs/${controller.images[controller.index.value]}.png',
                            width: controller.index == 2
                                ? screenWidth(1.5)
                                : screenWidth(1.7),
                            height: controller.index == 2
                                ? screenWidth(1.5)
                                : screenWidth(1.7)),
                      )),
                  PositionedDirectional(
                      bottom: screenWidth(14),
                      start: screenWidth(2.4),
                      child: Obx(
                        () => DotsIndicator(
                          dotsCount: controller.images.length,
                          position: controller.index.value,
                          decorator: DotsDecorator(
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                    width: 2, color: AppColors.whiteColor)),
                            activeColor: Colors.transparent,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      )),
                  PositionedDirectional(
                    bottom: screenWidth(5),
                    child: Container(
                      width: screenWidth(1),
                      height: screenWidth(15),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth(15),
                          ),
                          InkWell(
                              onTap: () {
                                controller.skipButton();
                              },
                              child: CustomText(
                                text: controller.index <
                                        controller.images.length - 1
                                    ? tr("key_skip")
                                    : '',
                                type: TextStyleType.CUSTOM,
                                fontFamily: 'Roboto',
                                textweight: FontWeight.w400,
                                textSize: screenWidth(25),
                                textColor: AppColors.whiteColor,
                              )),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                controller.nextButton();
                              },
                              child: CustomText(
                                text: controller.index <
                                        controller.images.length - 1
                                    ? tr("key_next")
                                    : tr("key_finish"),
                                type: TextStyleType.CUSTOM,
                                fontFamily: 'Roboto',
                                textweight: FontWeight.w400,
                                textSize: screenWidth(25),
                                textColor: AppColors.whiteColor,
                              )),
                          SizedBox(
                            width: screenWidth(15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
