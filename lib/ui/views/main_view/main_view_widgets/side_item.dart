import 'package:flutter/material.dart';

class SideItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final bool? needClose;
  const SideItem(
      {super.key,
      required this.icon,
      required this.title,
      this.needClose = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
          if (needClose!) Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              icon,
              size: 50,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 40),
            )
          ],
        ));
  }
}
