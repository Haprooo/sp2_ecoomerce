import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRdius;
  final VoidCallback onPressed;
  final Gradient? gradient;
  final double? width;
  final double? height;

  final Widget child;
  const CustomElevatedButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.width,
      this.height,
      this.gradient,
      this.borderRdius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRdius ?? BorderRadius.circular(0)),
      child: ElevatedButton(
        child: child,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: borderRdius ?? BorderRadius.circular(0))),
      ),
    );
  }
}
