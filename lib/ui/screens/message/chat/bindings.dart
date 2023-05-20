import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
