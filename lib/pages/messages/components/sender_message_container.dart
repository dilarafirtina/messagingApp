import 'package:cht1/models/chat_messages_model.dart';
import 'package:cht1/pages/messages/components/message_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/configuration.dart';
import '../../../widgets/custom_shape.dart';
import "dart:math";

@override
Widget senderTextMessage(ChatMessage message, Widget child) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Flexible(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: Get.size.width / 4),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: textBoxMe,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  child,
                  Container(
                    width: 90,
                    padding: const EdgeInsets.only(top: 5),
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          message.time,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        MessageStatusDot(status: message.messageStatus)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(pi),
            child: CustomPaint(
              painter: CustomShape(textBoxMe),
            ),
          ),
        ],
      ))
    ],
  );
}
