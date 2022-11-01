import 'package:flutter/material.dart';
import '../constants.dart';

Widget defaultButton({
  final String? text,
  final Function? press,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
    child: SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: primaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
