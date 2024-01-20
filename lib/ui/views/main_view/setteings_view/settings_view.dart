import 'package:e_commerce/core/enums/text_style_type.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomText(
      text: "Settings",
      type: TextStyleType.TITLE,
    ));
  }
}
