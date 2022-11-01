import 'package:animations/animations.dart';
import 'package:cht1/screens/chats/chats_screen.dart';
import 'package:cht1/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  RxInt pageIndex = 0.obs;

  List<Widget> pageList = <Widget>[
    ChatsScreen(),
    ChatsScreen(),
    ChatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: pageIndex.value,
            onTap: (value) {
              pageIndex.value = value;
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
