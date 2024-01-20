import 'package:sp2_ecoomerce/core/enums/text_style_type.dart';
import 'package:sp2_ecoomerce/ui/shared/colors.dart';
import 'package:sp2_ecoomerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SocialMediaSignin extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;

  const SocialMediaSignin({super.key, this.contentPadding});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          vertical: size.width / 21, horizontal: size.width / 20),
      width: size.width,
      height: size.width / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
        color: AppColors.blueColor,
      ),
      child: CustomText(
        text: 'SIGN IN WITH FACEBOOK',
        type: TextStyleType.CUSTOM,
        fontFamily: 'Roboto',
        textweight: FontWeight.w400,
        textSize: size.width / 25,
        textColor: AppColors.whiteColor,
      ),
    );
  }
}
