import 'package:cht1/screens/action_buttons/components/round_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget actionsMenu() {
  return Expanded(
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.8,
      children: [
        ActionTile(
          icon: Icons.restaurant,
          label: 'Alacarte Reservation',
          onTap: () {},
        ),
        ActionTile(
          icon: Icons.location_pin,
          label: 'Resource Reservation',
          onTap: () {},
        ),
        ActionTile(
          icon: Icons.car_rental,
          label: 'Transfer',
          onTap: () {},
        ),
        ActionTile(
          icon: Icons.task,
          label: 'Tasks',
          onTap: () {},
        ),
        ActionTile(
          icon: Icons.comment,
          label: 'Comments',
          onTap: () {},
        ),
        ActionTile(
          icon: Icons.person,
          label: 'Guest Action',
          onTap: () {},
        ),
        ActionTile(
          icon: Icons.info,
          label: 'Info List',
          onTap: () {},
        ),
      ],
    ),
  );
}
