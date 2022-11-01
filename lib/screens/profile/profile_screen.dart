import 'package:cht1/constants.dart';
import 'package:cht1/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../action_buttons/actions_view.dart';
import 'components/info.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Kristin Watson",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(height: defaultPadding * 2),
          const Info(
            infoKey: "Hotel",
            info: "BlueWave",
          ),
          const Info(
            infoKey: "Location",
            info: "New York, NYC",
          ),
          const Info(
            infoKey: "Phone",
            info: "(239) 555-0108",
          ),
          const Info(
            infoKey: "Email Address",
            info: "demo@mail.com",
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

showActionMenu() {
  Get.bottomSheet(
      ignoreSafeArea: true,
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select an Action",
            ),
            const SizedBox(height: 16),
            actionsMenu()
          ],
        ),
      ));
}
