import 'package:cht1/constants.dart';
import 'package:cht1/pages/profile/guest_info.dart';
import 'package:cht1/pages/profile/hotel_info.dart';
import 'package:cht1/pages/profile/interview_info.dart';
import 'package:flutter/material.dart';

bool isAllowed = false;
bool isTaskExist = true;

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            if (isTaskExist)
              Icon(Icons.sticky_note_2, color: Colors.red.shade600),
            Text(
              "Guest Info",
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16),
            ),
          ],
        ),
        actions: [
          ElevatedButton(onPressed: () => {}, child: Text("Merge Guest"))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(child: guestInfo(context)),
                const SizedBox(
                  height: defaultPadding,
                ),
                Container(child: interviewInfo(context)),
                const SizedBox(
                  height: defaultPadding,
                ),
                Expanded(child: hotelInfo(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
