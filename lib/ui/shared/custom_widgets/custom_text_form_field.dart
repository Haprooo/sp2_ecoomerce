import 'package:e_commerce/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;

  final TextEditingController? controller;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final IconData? suffIcon;
  final Color? suffColor;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.isPassword,
      this.validator,
      this.suffIcon,
      this.suffColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword ?? false,
      obscuringCharacter: '*',
      style: TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: size.width / 20, horizontal: size.width / 20),
        /* enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: BorderColor ?? Colors.transparent,
            width: BorderWidth ?? 1,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          ),*/

        /*focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.transparent,
            width: FoucsedBorderWidth ?? 1,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(0),
        ),*/

        suffixIcon: suffIcon != null
            ? Icon(
                suffIcon,
                color: suffColor ?? AppColors.blueColor,
              )
            : SizedBox(),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.whiteColor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: size.width / 28,
        ),
        filled: true,
        fillColor: AppColors.greyColor4,
      ),
    );
  }
}
