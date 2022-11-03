import 'package:cht1/constants.dart';
import 'package:flutter/material.dart';
import 'components/info.dart';

Widget guestInfo(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(defaultPadding),
    child: Column(
      children: [
        Text(
          "Kristin Watson",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const Divider(height: defaultPadding * 2),
        const Info(
          infoKey: "Hotel",
          info: "BlueWave",
        ),
        const Info(
          infoKey: "Location",
          info: "New York, NYC",
        ),
        const Info(
          infoKey: "Phone",
          info: "(239) 555-0108",
        ),
        const Info(
          infoKey: "Email Address",
          info: "demo@mail.com",
        ),
      ],
    ),
  );
}
