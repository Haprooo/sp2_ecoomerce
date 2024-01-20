import 'package:e_commerce/core/enums/bottom_navigation_type.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/views/main_view/main_controller.dart';
import 'package:e_commerce/ui/views/main_view/main_view_widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatefulWidget {
  final BottomNavigationEnum selectedView;
  final Function(BottomNavigationEnum, int) onTap;
  const CustomBottomNavigation(
      {super.key, required this.selectedView, required this.onTap});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(
            icon: Icons.home_outlined,
            isSelected: widget.selectedView == BottomNavigationEnum.HOME,
            onTap: () {
              widget.onTap(BottomNavigationEnum.HOME, 0);
            },
          ),
          NavItem(
            icon: Icons.favorite_outline,
            isSelected: widget.selectedView == BottomNavigationEnum.FAVORITE,
            onTap: () {
              widget.onTap(BottomNavigationEnum.FAVORITE, 1);
            },
          ),
          NavItem(
            icon: Icons.notification_add_outlined,
            isSelected:
                widget.selectedView == BottomNavigationEnum.NOTIFICATIONS,
            onTap: () {
              widget.onTap(BottomNavigationEnum.NOTIFICATIONS, 2);
            },
          ),
          NavItem(
            icon: Icons.settings_outlined,
            isSelected: widget.selectedView == BottomNavigationEnum.SETTINGS,
            onTap: () {
              widget.onTap(BottomNavigationEnum.SETTINGS, 3);
            },
          ),
        ],
      ),
    );
  }
}
