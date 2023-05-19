import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/core/middlewares/middlewares.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        // RouteWelcomeMiddleware(priority: 0),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.Contact,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),

    /*

   
    // check if needed to login or not
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),


    GetPage(name: AppRoutes.Contact, page: () => ContactPage(), binding: ContactBinding()),
    GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding()),
    GetPage(name: AppRoutes.Me, page: () => MePage(), binding: MeBinding()),
    GetPage(name: AppRoutes.Chat, page: () => ChatPage(), binding: ChatBinding()),

    GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImgViewPage(), binding: PhotoImgViewBinding()),*/
  ];
}
