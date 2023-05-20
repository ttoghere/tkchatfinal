import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/message/chat/widgets/chat_list.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'package:tkchatfinal/ui/values/values.dart';

class ChatPage extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _pageBody(context),
    );
  }

  SafeArea _pageBody(BuildContext context) => SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            children: [
              const ChatList(),
              Positioned(
                bottom: 0.h,
                height: 50.h,
                child: Container(
                  width: 360.w,
                  height: 50.h,
                  color: AppColors.primaryBackground,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 217.w,
                        height: 50.h,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          controller: controller.textController,
                          autofocus: false,
                          focusNode: controller.contentNode,
                          decoration: const InputDecoration(
                              hintText: "Send Message..."),
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        margin: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          child: Icon(
                            Icons.photo_outlined,
                            size: 35.w,
                            color: Colors.red[900],
                          ),
                          onTap: () {
                            _showPicker(context);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h, left: 10.w),
                        width: 80.w,
                        height: 35.h,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.sendMessage();
                          },
                          child: const Text("Send"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 131, 123, 231),
              Color.fromARGB(255, 104, 132, 231),
            ],
            transform: GradientRotation(45),
          ),
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
        child: Row(
          children: [
            _profileImage(),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 180.w,
              padding: EdgeInsets.only(top: 0.w, right: 0.w, bottom: 0.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 44.w,
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.state.to_name.value,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBackground,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            controller.state.to_location.value,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBackground,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _profileImage() {
    return Container(
      padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 44.w,
          height: 44.w,
          child: CachedNetworkImage(
            imageUrl: controller.state.to_avatar.value,
            imageBuilder: (context, imageProvider) {
              return Container(
                height: 44.w,
                width: 44.w,
                margin: null,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(44.w),
                ),
              );
            },
            errorWidget: (context, url, error) => const Image(
              image: AssetImage("assets/images/feature-1.png"),
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                ),
                title: const Text("Gallery"),
                onTap: () {
                  controller.galleryImage();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_outlined,
                ),
                title: const Text("Camera"),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
