import 'package:animations/animations.dart';
import 'package:cht1/screens/action_buttons/actions_view.dart';
import 'package:cht1/screens/conversation/main_screen.dart';
import 'package:cht1/screens/messages/message_screen.dart';
import 'package:cht1/screens/profile/hotel_info.dart';
import 'package:cht1/screens/profile/profile_screen.dart';
import 'package:cht1/widgets/default_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: MainScreen(),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: MessagesScreen()),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: ProfileScreen()),
                            Expanded(child: hoteInfo()),
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
