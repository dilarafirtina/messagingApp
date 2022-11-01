import 'package:cht1/constants.dart';
import 'package:cht1/screens/action_buttons/actions_view.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("images/user_2.png"),
            ),
            const SizedBox(width: defaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Kristin Watson",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Active 3m ago",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => {
                    showModalBottomSheet<void>(
                      context: context,
                      constraints:
                          BoxConstraints(maxWidth: 300, maxHeight: 400),
                      builder: (BuildContext context) {
                        return Container(child: actionsMenu());
                      },
                    ),
                  }),
          SizedBox(width: defaultPadding / 2),
        ],
      ),
      body: Body(),
    );
  }
}
