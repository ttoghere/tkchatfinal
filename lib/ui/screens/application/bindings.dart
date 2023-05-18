import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
  }
}
