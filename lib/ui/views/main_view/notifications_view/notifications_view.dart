import 'package:sp2_ecoomerce/core/enums/text_style_type.dart';
import 'package:sp2_ecoomerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomText(
      text: "Notifications",
      type: TextStyleType.TITLE,
    ));
  }
}
