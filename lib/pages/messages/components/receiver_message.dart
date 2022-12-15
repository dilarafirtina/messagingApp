import 'package:cht1/models/chat_messages.dart';
import 'package:cht1/pages/messages/components/message_status.dart';
import 'package:flutter/material.dart';

import '../../../utils/configuration.dart';
import '../../../widgets/custom_shape.dart';
import "dart:math";

@override
Widget receiverTextMessage(BuildContext context, ChatMessage message) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: CustomPaint(
                painter: CustomShape(Colors.white),
              ),
            ),
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 4),
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
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
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 14)),
                    Container(
                      width: 40,
                      padding: const EdgeInsets.only(top: 5),
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            message.time,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
