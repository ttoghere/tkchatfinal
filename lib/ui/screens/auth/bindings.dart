import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());  }
}
