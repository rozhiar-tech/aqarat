import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          var page = controller.pages[controller.pageIndex.value];
          return Scaffold(
            body: page,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: GNav(
                  tabs: const [
                    GButton(
                      icon: Ionicons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Ionicons.chatbubbles_outline,
                      text: 'Chat',
                    ),
                    GButton(
                      icon: Ionicons.heart_circle,
                      text: 'Favorite',
                    ),
                    GButton(
                      icon: Ionicons.map_outline,
                      text: 'Map',
                    ),
                  ],
                  //  selectedIndex: controller.pageIndex.value,
                  //  onTabChange: (index) {
                  //   controller.pageIndex.value = index;
                  // },

                  backgroundColor: Colors.white,

                  gap: 10,
                  color: AppColors.greenColor.withOpacity(0.5),
                  activeColor: AppColors.blackColor,
                  iconSize: 20,
                  // tabBackgroundColor: AppColors.greenColor.withOpacity(0.3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  duration: const Duration(milliseconds: 200),
                  tabBorderRadius: 10, curve: Curves.easeInOut,
                  tabMargin: const EdgeInsets.only(
                      top: 0, right: 6, left: 6, bottom: 0),
                  selectedIndex: controller.pageIndex.value,
                  onTabChange: (index) => controller.pageIndex.value = index,
                ),
              ),
            ),
          );
        });
  }
}
