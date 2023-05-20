import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/message/chat/widgets/chat_left_item.dart';
import 'package:tkchatfinal/ui/screens/message/chat/widgets/chat_right_item.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'package:tkchatfinal/ui/values/values.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: AppColors.chatbg,
        padding: EdgeInsets.only(bottom: 50.h),
        child: CustomScrollView(
          reverse: true,
          controller: controller.msgScrolling,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  var item = controller.state.msgContentList[index];
                  if (controller.user_id == item.uid) {
                    return ChatRightItem(item: item);
                  } else {
                    return ChatLeftItem(item: item);
                  }
                }, childCount: controller.state.msgContentList.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
