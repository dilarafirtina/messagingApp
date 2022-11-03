import 'package:cht1/constants.dart';
import 'package:cht1/pages/profile/guest_info.dart';
import 'package:cht1/pages/profile/hotel_info.dart';
import 'package:cht1/pages/profile/interview_info.dart';
import 'package:cht1/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: defaultDrawer(),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Guest Info",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: primaryColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          )
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
