import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/core/routes/routes.dart';
import 'package:tkchatfinal/core/store/store.dart';

/// Check if you are logged in
class RouteAuthMiddleware extends GetMiddleware {
  // priority - Small numbers have high priority
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRoutes.SIGN_IN || route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(
          const Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
