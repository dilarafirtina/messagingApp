import 'package:cht1/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'components/info.dart';

Widget guestInfo(BuildContext context) {
  bool isAllowed = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
            top: defaultPadding / 2),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            labelText: 'Communication Permission',
            labelStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14),
            enabled: false,
            suffixIcon: Icon(isAllowed ? Icons.check : Icons.cancel,
                color: isAllowed ? Colors.green.shade600 : Colors.red.shade600),
          ),
        ),
      ),
      // Container(
      //   decoration: BoxDecoration(
      //       color: greyColor,
      //       shape: BoxShape.rectangle,
      //       border: Border.all(color: Colors.grey.shade100, width: 1)),
      //   padding: const EdgeInsets.all(8),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         "Communication Permission",
      //         style: TextStyle(
      //           color: Theme.of(context)
      //               .textTheme
      //               .bodyText1!
      //               .color!
      //               .withOpacity(0.8),
      //         ),
      //       ),
      //       const Icon(
      //         IconlyBold.tick_square,
      //       )
      //     ],
      //   ),
      // ),
      Container(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
            top: defaultPadding / 2,
          ),
          child: Column(
            children: [
              Text(
                "Kristin Watson",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const Divider(height: defaultPadding),
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
          )),
    ],
  );
}
