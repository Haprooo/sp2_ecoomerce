import 'package:sp2_ecoomerce/core/enums/text_style_type.dart';
import 'package:sp2_ecoomerce/core/translation/app_translation.dart';
import 'package:sp2_ecoomerce/ui/shared/colors.dart';
import 'package:sp2_ecoomerce/ui/shared/shared%20widgets/custom_elevated_button.dart';
import 'package:sp2_ecoomerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:sp2_ecoomerce/ui/shared/utils.dart';
import 'package:sp2_ecoomerce/ui/views/landing_view/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  LandingController controller = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/pngs/main_background.png',
              width: screenWidth(1),
              fit: BoxFit.fitWidth,
            ),
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            width: screenWidth(1),
                            height: screenWidth(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.changeLanguage("en");
                                  },
                                  child: CustomText(
                                    text: "English",
                                    type: TextStyleType.CUSTOM,
                                    fontFamily: 'Roboto',
                                    textweight: FontWeight.w500,
                                    textSize: screenWidth(25),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.changeLanguage("ar");
                                  },
                                  child: CustomText(
                                    text: "العربية",
                                    type: TextStyleType.CUSTOM,
                                    fontFamily: 'Roboto',
                                    textweight: FontWeight.w500,
                                    textSize: screenWidth(25),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.language_outlined,
                    size: screenWidth(7),
                    color: AppColors.gradientPoint1,
                  ),
                )),
            Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(5), bottom: screenWidth(20)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/pngs/logo.png',
                      width: screenWidth(2),
                      height: screenWidth(2),
                    ),
                    Spacer(),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(bottom: screenWidth(35)),
                      child: CustomElevatedButton(
                        child: CustomText(
                          text: tr("key_login"),
                          type: TextStyleType.CUSTOM,
                          fontFamily: 'Roboto',
                          textweight: FontWeight.w500,
                          textSize: screenWidth(25),
                          textColor: AppColors.whiteColor,
                        ),
                        borderRdius: BorderRadius.circular(30),
                        onPressed: () {
                          controller.login_button();
                        },
                        width: screenWidth(1.3),
                        height: screenWidth(8),
                        gradient: LinearGradient(colors: [
                          AppColors.gradientPoint1,
                          AppColors.gradientPoint2,
                          AppColors.gradientPoint3
                        ]),
                      ),
                    ),
                    CustomElevatedButton(
                      child: CustomText(
                          text: tr("key_signup"),
                          type: TextStyleType.CUSTOM,
                          fontFamily: 'Roboto',
                          textweight: FontWeight.w500,
                          textSize: screenWidth(25),
                          textColor: AppColors.gradientPoint1),
                      borderRdius: BorderRadius.circular(30),
                      onPressed: () {
                        controller.signup_button();
                      },
                      width: screenWidth(1.3),
                      height: screenWidth(8),
                      gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.white,
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
