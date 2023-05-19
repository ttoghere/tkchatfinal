import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tkchatfinal/core/entities/entities.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/ui/values/values.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = controller.state.contactList[index];
                return _buildListItem(item);
              }, childCount: controller.state.contactList.length),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(UserData item) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.w,
        left: 15.w,
        right: 15.w,
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Profile Pic
            Container(
              padding: EdgeInsets.only(
                top: 0.w,
                left: 0.w,
                right: 15.w,
              ),
              child: SizedBox(
                width: 54.w,
                height: 54.w,
                child: CachedNetworkImage(imageUrl: "${item.photourl}"),
              ),
            )
            //Title
            ,
            Container(
              width: 250.w,
              padding: EdgeInsets.only(
                top: 15.w,
                left: 0.w,
                right: 0.w,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.red[900]!,
                  ),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 42.w,
                    child: Text(
                      item.name ?? "",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.bold,
                        color: AppColors.thirdElement,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
