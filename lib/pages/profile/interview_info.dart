import 'package:cht1/constants.dart';
import 'package:flutter/material.dart';
import 'components/info.dart';

Widget interviewInfo(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(defaultPadding),
    child: Column(
      children: [
        Text(
          "Last Interview Info",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(height: defaultPadding * 2),
        const Info(
          infoKey: "Date",
          info: "21.01.2022",
        ),
        const Info(
          infoKey: "Interviewer",
          info: "Dilara Fırtına",
        ),
      ],
    ),
  );
}
