import 'package:cht1/constants.dart';
import 'package:cht1/utils/app_routes.dart';
import 'package:cht1/widgets/networkimage_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

Widget defaultDrawer({
  final String? text,
  final Function? press,
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: cachedNetworkImage(
            logoImage,
            BoxFit.contain,
            'drawer',
          ),
        ),
        _buildListTile('Login', IconlyBold.login, '', Colors.grey.shade500,
            onTab: () => Get.toNamed(AppRoutes.splash)),
      ],
    ),
  );
}

final theme = ThemeData.light();
Widget _buildListTile(String title, IconData icon, String trailing, Color color,
    {onTab}) {
  return ListTile(
      contentPadding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      leading: Container(
        width: 46,
        height: 46,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
        child: Center(
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
      title: Text(title),
      trailing: Container(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(trailing,
                style: theme.textTheme.bodyText1
                    ?.copyWith(color: Colors.grey.shade600)),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
      onTap: onTab);
}
