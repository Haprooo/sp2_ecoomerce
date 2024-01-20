import 'package:e_commerce/core/enums/text_style_type.dart';
import 'package:e_commerce/core/translation/app_translation.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/shared/shared%20widgets/social_media_signin.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/signup_view/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/pngs/main_background.png',
              width: screenWidth(1),
              fit: BoxFit.fitWidth,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: screenWidth(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenWidth(2.3), bottom: screenWidth(4)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: screenWidth(20)),
                                  child: InkWell(
                                    onTap: () {
                                      controller.goToLogIn();
                                    },
                                    child: CustomText(
                                      text: tr("key_login"),
                                      type: TextStyleType.CUSTOM,
                                      fontFamily: 'Roboto',
                                      textweight: FontWeight.w500,
                                      textSize: screenWidth(18),
                                      textColor: AppColors.lightwhiteColor,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: tr("key_signup"),
                                  type: TextStyleType.CUSTOM,
                                  fontFamily: 'Roboto',
                                  textweight: FontWeight.w500,
                                  textSize: screenWidth(18),
                                  textColor: AppColors.whiteColor,
                                ),
                              ]),
                        ),
                        Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    bottom: screenWidth(200)),
                                child: CustomTextFormField(
                                    controller: controller.usernameController,
                                    hintText: tr("key_username"),
                                    validator: (value) {
                                      //!---- value => usernameController.text
                                      if (value!.isEmpty)
                                        return tr("key_emptyEmailValidation");
                                      else if (!controller.isEmailValid(value))
                                        return tr("key_complexEmailValidation");
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    bottom: screenWidth(200)),
                                child: CustomTextFormField(
                                  controller: controller.passwordController,
                                  hintText: tr("key_password"),
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return tr("key_emptyPasswordValidation");
                                    else if (!controller
                                        .isComplexPassword(value))
                                      return tr(
                                          "key_complexPasswordValidation");
                                  },
                                ),
                              ),
                              CustomTextFormField(
                                controller:
                                    controller.confirmPasswordController,
                                hintText: tr("key_confirmpassword"),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return tr(
                                        "key_emptyConfirmPasswordValidation");
                                  else if (value !=
                                      controller.passwordController.text)
                                    return tr(
                                        "key_passwordDontMatchValidation");
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenWidth(20),
                              bottom: screenWidth(10),
                              start: screenWidth(20)),
                          child: Obx(
                            () => controller.isLoading.value
                                ? SpinKitCircle(
                                    color: AppColors.gradientPoint2,
                                  )
                                : InkWell(
                                    onTap: () {
                                      controller.signUbButton();
                                    },
                                    child: CustomText(
                                      text: tr("key_signup"),
                                      type: TextStyleType.BODY,
                                      textweight: FontWeight.bold,
                                      textColor: AppColors.whiteColor,
                                      textSize: screenWidth(30),
                                    ),
                                  ),
                          ),
                        ),
                        SocialMediaSignin(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
