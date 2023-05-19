import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/core/routes/routes.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'package:tkchatfinal/ui/values/values.dart';
import 'package:tkchatfinal/ui/widgets/widgets.dart';

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
      children: [
        const Center(
          child: SizedBox(
            child: Text("Chat"),
          ),
        ),
        ContactPage(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: Text("Profile"),
              ),
              btnFlatButtonWidget(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.toNamed(AppPages.INITIAL);
                  },
                  title: "Sign Out"),
            ],
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
