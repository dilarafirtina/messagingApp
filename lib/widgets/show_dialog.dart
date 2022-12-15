import '../utils/configuration.dart';
import 'package:flutter/material.dart';

Widget customAlertDialog(
    BuildContext context, String title, final Widget child) {
  return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: kPrimaryColor,
        ),
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(defaultPadding),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      content: child);
}
