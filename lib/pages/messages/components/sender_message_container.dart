import 'package:cht1/models/chat_messages_model.dart';
import 'package:cht1/pages/messages/components/message_status.dart';
import 'package:cht1/theme/Themes.dart';
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(currentUser,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      PopupMenuButton<int>(
                        tooltip: "Message Actions",
                        icon: Icon(
                          size: 25,
                          Icons.expand_more,
                          color: Colors.grey.shade600,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            onTap: () => {},
                            child: Row(
                              children: const [
                                Icon(Icons.note, color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add Notes",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            onTap: () => {},
                            child: Row(
                              children: const [
                                Icon(Icons.people, color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Reply",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                        offset: Offset(0, 40),
                        color: kSecondaryColor,
                        elevation: 3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  child,
                  Container(
                    //width: 90,
                    constraints: BoxConstraints(maxWidth: 50),
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
