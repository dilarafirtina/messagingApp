import 'package:cht1/pages/profile/guest_info.dart';
import 'package:cht1/pages/profile/hotel_info.dart';
import 'package:cht1/pages/profile/interview_info.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Guest Info",
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16),
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
              children: [
                Expanded(child: guestInfo(context)),
                Expanded(child: hotelInfo(context)),
                Expanded(child: interviewInfo(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
