import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'package:tkchatfinal/ui/values/values.dart';

class ApplicationPage extends GetView<ApplicationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  //Pages List
  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: const [
        Center(
          child: SizedBox(
            child: Text("Chat"),
          ),
        ),
        Center(
          child: SizedBox(
            child: Text("Contacts"),
          ),
        ),
        Center(
          child: SizedBox(
            child: Text("Profile"),
          ),
        ),
      ],
    );
  }

  //BottomNav
  Widget _buildBottomNav() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          controller.handleNavTap(value);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.tabBarElement,
        selectedItemColor: AppColors.thirdElementText,
      ),
    );
  }
}
