import 'package:cht1/constants.dart';
import 'package:cht1/pages/action_buttons/actions_menu.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesView extends StatelessWidget {
  bool timeLimitExceeded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: messageBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.key,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  "1442",
                  style: TextStyle(fontSize: 12),
                )
              ],
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
                  "VIP",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: greyColor,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.grey.shade100, width: 1)),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Icon(timeLimitExceeded ? Icons.lock_clock : Icons.alarm,
                      color: timeLimitExceeded
                          ? Colors.red.shade600
                          : Colors.green.shade600),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Remaining Time",
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Yesterday",
                        style: TextStyle(color: Colors.black87),
                      )
                    ],
                  )
                ],
              )),
          TextButton(
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () => {
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              titlePadding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              title: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0)),
                                  color: primaryColor,
                                ),
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(defaultPadding),
                                child: Text(
                                  "Choose Action",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              content: Container(
                                  width: 400,
                                  height: 500,
                                  child: actionsMenu(context)));
                        })
                  }),
          const SizedBox(width: defaultPadding / 2),
        ],
      ),
      body: Body(),
    );
  }
}
