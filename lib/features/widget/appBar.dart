import 'package:ecom_task/core/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget commonAppbar(
    {required BuildContext context,
    String? title,
    Function? onBackButtonPressed,
    List<Widget>? actions,
    Color? bgColor = ColorResources.newBg}) {
  return AppBar(
    backgroundColor: bgColor,
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: true,
    title: Transform(
      transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
      child: Text(
        title ?? "",
        style: const TextStyle(
            color: ColorResources.white,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const SizedBox(
          height: 40,
          width: 40,
          child: Center(
              child: Icon(
            Icons.arrow_back_ios,
            color: ColorResources.black,
            size: 16,
          )),
        ),
      ),
    ),
    actions: actions ?? [],
  );
}

PreferredSizeWidget appbarWithoutBackbutton({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: ColorResources.newBg,
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: true,
    title: Transform(
      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
      child: Text(
        title ?? "",
        style: const TextStyle(
            color: ColorResources.white,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    ),
    actions: actions ?? [],
  );
}
