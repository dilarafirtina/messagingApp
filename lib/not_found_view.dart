import 'package:cht1/constants.dart';
import 'package:cht1/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double defaultPadding = 0;

class UnknownView extends StatelessWidget {
  const UnknownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: ElevatedButton(
          onPressed: () => Get.toNamed(AppRoutes.main),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: primaryColor),
          child: Icon(Icons.arrow_back, color: Colors.grey.shade50),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: defaultPadding),
            Text(
              "Looks like you are lost!",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "This page doesn't exist.  Go back to previous page.",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
