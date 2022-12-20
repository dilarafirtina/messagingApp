import 'package:get/get.dart';

import '../../../utils/configuration.dart';
import 'package:cht1/models/chat_messages_model.dart';
import 'package:cht1/widgets/networkimage_widget.dart';
import 'package:flutter/material.dart';

Widget mediaMessage(ChatMessage message) {
  return SizedBox(
    width: Get.size.width / 4,
    child: AspectRatio(
      aspectRatio: 1.6,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: defaultPadding),
            height: Get.size.width * 0.55,
            width: Get.size.width * 0.35,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: textBoxMe, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: cachedNetworkImage(
                    message.url ?? "", BoxFit.cover, 'message')),
          )
        ],
      ),
    ),
  );
}
