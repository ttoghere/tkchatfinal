import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';


class ContactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
