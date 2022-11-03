import 'package:animations/animations.dart';
import 'package:cht1/constants.dart';
import 'package:cht1/models/Chat.dart';
import 'package:cht1/pages/chats/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsView extends StatelessWidget {
  ChatsView({super.key});

  List<Widget> pageList = <Widget>[
    chatList(queueData),
    chatList(acceptedData),
    chatList(resolvedData)
  ];

  @override
  Widget build(BuildContext context) {
    RxInt pageIndex = 0.obs;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: pageIndex.value,
            onTap: (index) {
              pageIndex.value = index;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.queue), label: "Queue"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Accepted"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check), label: "Resolved"),
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
}
