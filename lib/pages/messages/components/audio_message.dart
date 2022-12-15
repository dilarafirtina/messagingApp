import 'package:cht1/models/chat_messages.dart';
import 'package:flutter/material.dart';

import '../../../utils/configuration.dart';

Widget audioMessage(BuildContext context, ChatMessage message) {
  return Container(
    width: MediaQuery.of(context).size.width / 4,
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding * 0.75,
      vertical: defaultPadding,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: message!.isSender ? textBoxMe : Colors.white,
    ),
    child: Row(
      children: [
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
        Text(
          "0.37",
          style: TextStyle(
              fontSize: 12, color: message.isSender ? Colors.white : null),
        ),
      ],
    ),
  );
}
