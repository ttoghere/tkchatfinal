import 'dart:developer';

import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:tkchatfinal/core/routes/routes.dart';
import 'package:tkchatfinal/core/store/store.dart';

/// first welcome page
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority Small numbers have high priority
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    log("${ConfigStore.to.isFirstOpen}");
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.Application);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
