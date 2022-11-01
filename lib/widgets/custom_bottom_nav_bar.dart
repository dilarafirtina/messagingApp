import 'package:cht1/constants.dart';
import 'package:cht1/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    Color inActiveIconColor = Colors.grey.shade200;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.shade50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: Colors.grey.shade50.withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(IconlyBold.home),
                iconSize: 30,
                color: MenuState.chat == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
                onPressed: () => Get.toNamed(AppRoutes.chats),
              ),
              IconButton(
                  icon: Icon(IconlyBold.category),
                  iconSize: 30,
                  color: MenuState.services == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                  onPressed: () => Get.toNamed(AppRoutes.main)),
              IconButton(
                icon: Icon(IconlyBold.calendar),
                iconSize: 30,
                color: MenuState.reservations == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
                onPressed: () => Get.toNamed(AppRoutes.main),
              ),
              IconButton(
                icon: Icon(IconlyBold.star),
                iconSize: 30,
                color: MenuState.offers == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
                onPressed: () => Get.toNamed(AppRoutes.main),
              ),
            ],
          )),
    );
  }
}
