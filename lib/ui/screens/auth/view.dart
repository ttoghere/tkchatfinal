import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/auth/index.dart';
import 'package:tkchatfinal/ui/values/values.dart';
import 'package:tkchatfinal/ui/widgets/widgets.dart';

class SignInPage extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin(),
          ],
        ),
      ),
    );
  }

  //Page Header
  Widget _buildLogo() {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(top: 84.h),
      child: Column(
        children: [
          //App Logo
          Container(
            width: 76.w,
            height: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 76.w,
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        boxShadow: const [Shadows.primaryShadow],
                        borderRadius: BorderRadius.circular(35)),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    "assets/images/ic_launcher.png",
                    width: 76.w,
                    height: 76.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
            child: Text(
              "Let's Chat",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.thirdElement,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: 1),
            ),
          )
        ],
      ),
    );
  }

  //Page Body
  Widget _buildThirdPartyLogin() {
    return SizedBox(
      width: 295.w,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Sign in with social networks",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
              child: btnFlatButtonWidget(
                  onPressed: () {
                    controller.handleGoogleSignIn();
                  },
                  width: 200.w,
                  height: 55.w,
                  title: "Google Login"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
              child: btnFlatButtonWidget(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  width: 200.w,
                  height: 55.w,
                  title: "SignOut Login"),
            ),
          ],
        ),
      ),
    );
  }
}
