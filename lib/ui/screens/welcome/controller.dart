import 'package:get/get.dart';
import 'package:tkchatfinal/core/routes/routes.dart';
import 'package:tkchatfinal/core/store/store.dart';
import 'package:tkchatfinal/ui/screens/welcome/index.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  dynamic changePage(int index) async {
    state.index.value = index;
  }

  handleSignIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
