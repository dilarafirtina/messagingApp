import 'package:cht1/utils/configuration.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  final String? text,
  final Function? press,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
    child: SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: kPrimaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
