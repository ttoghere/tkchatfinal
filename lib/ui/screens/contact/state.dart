import 'package:get/get.dart';
import 'package:tkchatfinal/core/entities/user.dart';

class ContactState {
  var count = 0.obs;
  RxList<UserData> contactList = <UserData>[].obs;
}
