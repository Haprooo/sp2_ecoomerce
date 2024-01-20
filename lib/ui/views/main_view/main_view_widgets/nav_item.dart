import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function() onTap;
  const NavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          margin: EdgeInsetsDirectional.only(bottom: screenWidth(70)),
          decoration: BoxDecoration(
              border: isSelected
                  ? Border(
                      bottom:
                          BorderSide(color: AppColors.yellowColor, width: 4))
                  : null),
          child: Icon(
            icon,
            size: 40,
            color: isSelected ? AppColors.yellowColor : AppColors.whiteColor,
          )),
    );
  }
}
