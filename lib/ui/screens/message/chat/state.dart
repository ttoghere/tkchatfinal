import 'package:get/get.dart';
import 'package:tkchatfinal/core/entities/entities.dart';

class ChatState {
  RxList<Msgcontent> msgContentList = <Msgcontent>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_location = "Unknown".obs;
}
