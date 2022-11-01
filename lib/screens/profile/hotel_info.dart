import 'package:cht1/constants.dart';
import 'package:cht1/screens/profile/components/info.dart';
import 'package:flutter/material.dart';

@override
Widget hoteInfo() {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        bottom: const TabBar(
          tabs: [
            Tab(text: "Last Stay"),
            Tab(text: "Current Stay"),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: const [
                Info(
                  infoKey: "Location",
                  info: "New York, NYC",
                ),
                Info(
                  infoKey: "Phone",
                  info: "(239) 555-0108",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: const [
                Info(
                  infoKey: "Location",
                  info: "London",
                ),
                Info(
                  infoKey: "Phone",
                  info: "(239) 555-0108",
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
