import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/core/entities/entities.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'package:tkchatfinal/ui/values/values.dart';
import 'package:tkchatfinal/ui/widgets/widgets.dart';

import 'widgets/contacts_list.dart';

class ContactPage extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }

  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Text(
      "Contact",
      style: TextStyle(
        color: AppColors.primaryBackground,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ));
  }
}
