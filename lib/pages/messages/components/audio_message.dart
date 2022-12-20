import 'package:cht1/models/chat_messages_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/configuration.dart';
import '../../../widgets/networkimage_widget.dart';
import '../../../widgets/widgets.dart';

Widget audioMessage(ChatMessage message) {
  return Container(
    width: Get.size.width / 4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: message!.isSender ? textBoxMe : Colors.white,
    ),
    child: Row(
      children: [
        if (message!.isSender)
          CircleAvatar(
            backgroundColor: ColorConstants.gray100,
            child: const Icon(Icons.person, size: 20, color: Colors.white),
          ),
        Icon(
          Icons.play_arrow,
          color: Colors.grey.shade500,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey.shade500,
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Text(
          "0.37",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        if (!message!.isSender) circleAvatar(message.avatar!),
      ],
    ),
  );
}
