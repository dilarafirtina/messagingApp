import 'package:animations/animations.dart';
import 'package:cht1/models/media_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/location.dart';
import 'widgets/message_types.dart';
import 'widgets/media_slider.dart';

List<Widget> pageList = <Widget>[
  templateMessage(),
  mediaSlider(imageList),
  mediaSlider(videoList),
  mediaSlider(documentList),
  locations(() {}),
  mediaSlider(stickerList),
];

@override
Widget attachments(BuildContext context) {
  RxInt pageIndex = 0.obs;

  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Obx(
        () => BottomNavigationBar(
          elevation: 1.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex.value,
          onTap: (index) {
            pageIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: "Messages"),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Image"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_file), label: "Video"),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_present), label: "Document"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_pin), label: "Location"),
            BottomNavigationBarItem(
                icon: Icon(Icons.eight_mp), label: "Sticker"),
          ],
        ),
      ),
    ),
    body: PageTransitionSwitcher(
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: Obx(() => pageList[pageIndex.value]),
    ),
  );
}