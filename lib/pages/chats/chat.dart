import '../../utils/configuration.dart';
import 'package:cht1/pages/chats/components/chat_card.dart';
import 'package:flutter/material.dart';

Widget chatList(List data) {
  return Scaffold(
    body: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            onChanged: (value) {},
            decoration: const InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) =>
                ChatCard(chat: data[index], press: () => {}),
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: kPrimaryColor,
      child: const Icon(
        Icons.person_add_alt_1,
        color: Colors.white,
      ),
    ),
  );
}
