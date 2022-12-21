import 'package:get/get.dart';

import '../../../utils/configuration.dart';
import 'package:cht1/models/chat_messages_model.dart';
import 'package:cht1/widgets/networkimage_widget.dart';
import 'package:flutter/material.dart';

Widget mediaMessage(ChatMessage message) {
  return Column(
    children: [
      Container(
        //margin: const EdgeInsets.only(bottom: defaultPadding),
        //height: 200,
        width: Get.size.width * 0.35,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: textBoxMe, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: cachedNetworkImage(
                  message.url ?? "", BoxFit.cover, 'message')),
        ]),
      ),
      if (message.text!.isNotEmpty)
        const SizedBox(
          height: 10,
        ),
      if (message.text!.isNotEmpty)
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              message.text ?? "",
            ))
    ],
  );
}
