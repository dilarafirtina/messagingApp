import 'package:audioplayers/audioplayers.dart';
import 'package:cht1/models/chat_messages_model.dart';
import 'package:cht1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/configuration.dart';
import '../../../widgets/widgets.dart';

Widget audioMessage(ChatMessage message) {
  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  final audioPlayer = AudioPlayer();

  audioPlayer.onPlayerStateChanged.listen((state) {
    isPlaying.value = state == PlayerState.playing;
  });

  audioPlayer.onDurationChanged.listen((newDuration) {
    duration.value = newDuration;
  });

  audioPlayer.onPositionChanged.listen((newPosition) {
    position.value = newPosition;
  });

  return Container(
    width: Get.size.width / 4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: message!.isSender ? textBoxMe : Colors.white,
    ),
    child: Row(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10, right: 0),
            child: InkWell(
              onTap: () async {
                if (isPlaying.value) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.play(UrlSource(message.url!));
                }
              },
              child: Obx(() => Icon(
                  !isPlaying.value
                      ? Icons.play_circle_fill
                      : Icons.pause_circle_filled,
                  color: Colors.grey.shade500,
                  size: 32)),
            )),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => Slider(
                    inactiveColor: Colors.grey.shade500,
                    min: 0,
                    max: duration.value.inSeconds.toDouble(),
                    value: position.value.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatedTime(position.value.inSeconds).toString(),
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        Text(
                          formatedTime(duration.value.inSeconds -
                                  position.value.inSeconds)
                              .toString(),
                          style: TextStyle(color: Colors.grey.shade500),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
        if (!message!.isSender) circleAvatar(message.avatar!),
      ],
    ),
  );
}

formatedTime(int inSeconds) {
  int sec = inSeconds % 60;
  int min = (inSeconds / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}
