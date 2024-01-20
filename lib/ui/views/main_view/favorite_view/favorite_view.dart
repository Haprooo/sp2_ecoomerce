import 'package:e_commerce/core/enums/text_style_type.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomText(
      text: "Favorites",
      type: TextStyleType.TITLE,
    ));
  }
}
