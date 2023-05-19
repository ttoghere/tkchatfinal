import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/core/entities/entities.dart';
import 'package:tkchatfinal/core/entities/user.dart';
import 'package:tkchatfinal/core/store/user.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';

class ContactController extends GetxController {
  final state = ContactState();
  ContactController();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  asyncLoadAllData() async {
    var userbase = await db
        .collection("users")
        // .where("id", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userData, options) => userData.toFirestore())
        .get();

    for (var doc in userbase.docs) {
      state.contactList.add(doc.data());
      log(doc.toString());
    }
  }

  goChat(UserData to_userdata) async {
    var from_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where(
          "from_uid",
          isEqualTo: token,
        )
        .where("to_uid", isEqualTo: to_userdata.id)
        .get();
    var to_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where(
          "from_uid",
          isEqualTo: to_userdata.id,
        )
        .where("to_uid", isEqualTo: token)
        .get();
  }

  @override
  void onReady() {
    asyncLoadAllData();
    super.onReady();
  }
}
