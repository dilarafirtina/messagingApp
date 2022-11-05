import 'package:cht1/constants.dart';
import 'package:cht1/models/ChatMessage.dart';
import 'package:cht1/widgets/networkimage_widget.dart';
import 'package:flutter/material.dart';

Widget mediaMessage(BuildContext context, ChatMessage message) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 4,
    child: AspectRatio(
      aspectRatio: 1.6,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: defaultPadding),
            height: MediaQuery.of(context).size.width * 0.55,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: textBoxMe, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: cachedNetworkImage(
                    "https://yasmak.opex.app/images/splash1.jpg",
                    BoxFit.cover,
                    'message')),
          )
        ],
      ),
    ),
  );
}
