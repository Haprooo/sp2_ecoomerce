import 'package:e_commerce/core/enums/text_style_type.dart';
import 'package:e_commerce/core/translation/app_translation.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/shared/shared%20widgets/social_media_signin.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/login_view/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

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
                                  child: CustomText(
                                    text: tr("key_login"),
                                    type: TextStyleType.CUSTOM,
                                    fontFamily: 'Roboto',
                                    textweight: FontWeight.w500,
                                    textSize: screenWidth(18),
                                    textColor: AppColors.whiteColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.goToSignUp();
                                  },
                                  child: CustomText(
                                    text: tr("key_signup"),
                                    type: TextStyleType.CUSTOM,
                                    fontFamily: 'Roboto',
                                    textweight: FontWeight.w500,
                                    textSize: screenWidth(18),
                                    textColor: AppColors.lightwhiteColor,
                                  ),
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
                                    hintText: tr("key_email"),
                                    validator: (value) {
                                      //!---- value => usernameController.text

                                      if (value!.isEmpty)
                                        return tr("key_emptyEmailValidation");
                                      else if (!controller.isEmailValid(value))
                                        return tr("key_complexEmailValidation");
                                    }),
                              ),
                              CustomTextFormField(
                                controller: controller.passwordController,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return tr("key_emptyPasswordValidation");
                                  else if (!controller.isComplexPassword(value))
                                    return tr("key_complexPasswordValidation");
                                },
                                hintText: tr("key_password"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.only(
                                top: screenWidth(20),
                                bottom: screenWidth(5),
                                start: screenWidth(20)),
                            child: Obx(
                              () => controller.isLoading.value
                                  ? SpinKitCircle(
                                      color: AppColors.gradientPoint2,
                                    )
                                  : Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.login_button();
                                          },
                                          child: CustomText(
                                            text: tr("key_loginButton"),
                                            type: TextStyleType.CUSTOM,
                                            fontFamily: 'Roboto',
                                            textweight: FontWeight.w400,
                                            textSize: screenWidth(25),
                                            textColor: AppColors.whiteColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth(20),
                                        ),
                                        CustomText(
                                          text: tr("key_rememberMeButton"),
                                          type: TextStyleType.CUSTOM,
                                          textweight: FontWeight.w400,
                                          textSize: screenWidth(25),
                                          fontFamily: 'Roboto',
                                          textColor: AppColors.whiteColor,
                                        ),
                                        Checkbox(
                                            value: controller.isChecked.value,
                                            onChanged: (bool? value) {
                                              controller.isChecked.value =
                                                  value!;
                                            }),
                                      ],
                                    ),
                            )),
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
