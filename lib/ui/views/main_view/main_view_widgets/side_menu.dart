import 'package:e_commerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/views/landing_view/landing_view.dart';
import 'package:e_commerce/ui/views/main_view/main_view_widgets/side_item.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: AppColors.blueColor,
      child: Column(
        children: [
          SideItem(icon: Icons.abc, title: 'title', onTap: () {}),
          SideItem(icon: Icons.abc, title: 'title', onTap: () {}),
          SideItem(icon: Icons.abc, title: 'title', onTap: () {}),
          SideItem(icon: Icons.abc, title: 'title', onTap: () {}),
          SideItem(
              icon: Icons.abc, title: 'AboutUs', needClose: true, onTap: () {}),
          SideItem(
              icon: Icons.person,
              title: 'Logout',
              onTap: () {
                SharedPrefrenceRepository().setLoggedIn(false);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return LandingView();
                  },
                ));
              }),
        ],
      ),
    );
  }
}
