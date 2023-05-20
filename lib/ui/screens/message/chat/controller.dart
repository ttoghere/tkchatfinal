// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:tkchatfinal/core/entities/entities.dart';
import 'package:tkchatfinal/core/store/user.dart';
import 'package:tkchatfinal/ui/screens/message/chat/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tkchatfinal/ui/utils/utils.dart';

class ChatController extends GetxController {
  final state = ChatState();
  ChatController();
  var doc_id;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listener;
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data["doc_id"];
    state.to_uid.value = data["to_uid"] ?? "";
    state.to_name.value = data["to_name"] ?? "";
    state.to_avatar.value = data["to_avatar"] ?? "";
  }

  @override
  void onReady() {
    var messages = db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent content, options) => content.toFirestore())
        .orderBy("addtime", descending: true);
    state.msgContentList.clear();
    listener = messages.snapshots().listen(
      (event) {
        for (var change in event.docChanges) {
          switch (change.type) {
            case DocumentChangeType.added:
              if (change.doc.data() != null) {
                state.msgContentList.insert(0, change.doc.data()!);
              }
              break;
            case DocumentChangeType.modified:
              break;
            case DocumentChangeType.removed:
              break;
          }
        }
      },
      onError: (error) => log("Listen Error: $error"),
    );
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    listener.cancel();
    super.dispose();
  }

  sendMessage() async {
    String sendContent = textController.text;
    final content = Msgcontent(
      uid: user_id,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now(),
    );
    await db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
          fromFirestore: Msgcontent.fromFirestore,
          toFirestore: (Msgcontent content, options) => content.toFirestore(),
        )
        .add(content)
        .then((DocumentReference doc) {
      log("Document snapshot added with id: ${doc.id}");
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await db.collection("message").doc(doc_id).update({
      "last_msg": sendContent,
      "last_time": Timestamp.now(),
    });
  }

  Future galleryImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
    } else {
      log("No image selected");
    }
  }

  Future uploadFile() async {
    if (_photo == null) {
      final fileName = getRandomString(15) + extension(_photo!.path);
      try {
        final ref = FirebaseStorage.instance.ref("chat").child(fileName);
        ref.putFile(_photo!).snapshotEvents.listen((event) async {
          switch (event.state) {
            case TaskState.running:
              break;
            case TaskState.paused:
              break;
            case TaskState.success:
              String imgUrl = await getImgUrl(fileName);
              sendImageMessage(imgUrl);
            case TaskState.canceled:
              break;
            case TaskState.error:
              break;
          }
        });
      } catch (e) {
        log("There is an error: $e");
      }
    }
  }

  Future getImgUrl(String fileName) async {
    final spaceRef = FirebaseStorage.instance.ref("chat").child(fileName);
    var str = await spaceRef.getDownloadURL();
    return str;
  }

  sendImageMessage(String url) async {
    final content = Msgcontent(
      uid: user_id,
      content: url,
      type: "image",
      addtime: Timestamp.now(),
    );
    await db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) =>
                msgcontent.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      log("Document Snapshot Added with id: ${doc.id}");
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await db.collection("message").doc(doc_id).update({
      "last_msg": "[image]",
      "last_time": Timestamp.now(),
    });
  }
}
