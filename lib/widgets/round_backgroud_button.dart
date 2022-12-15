import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

Widget backGoundRoundButton({
  final double top = 5,
  final double bottom = 5,
  final double right = 5,
  final double left = 5,
}) {
  return Container(
    margin: EdgeInsets.only(
      top: top,
      bottom: bottom,
      right: right,
      left: left,
    ),
    height: 45,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6), shape: BoxShape.circle),
    child: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.find<AppController>().goBack(returnValue: true);
      },
      color: Colors.black87,
    ),
  );
}
