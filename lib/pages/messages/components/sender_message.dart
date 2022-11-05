import 'package:cht1/models/ChatMessage.dart';
import 'package:cht1/pages/messages/components/message_status.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/custom_shape.dart';
import "dart:math";

@override
Widget senderTextMessage(BuildContext context, ChatMessage message) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Flexible(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 4),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: textBoxMe,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message.text,
                      textAlign: TextAlign.start,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 14)),
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
          CustomPaint(painter: CustomShape(textBoxMe)),
        ],
      ))
    ],
  );
}
