import 'package:cht1/pages/chats/chats_view.dart';
import 'package:cht1/pages/messages/message_view.dart';
import 'package:cht1/pages/profile/profile_view.dart';
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
                      child: ChatsView(),
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
                        child: ProfileScreen()),
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
