import 'package:cht1/widgets/filled_outline_button.dart';
import 'package:cht1/constants.dart';
import 'package:cht1/pages/profile/components/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Map<String, String>> stayInfo = [
  {"location": "Alanya", "date": "01.08.2020", "status": "completed"},
  {"location": "Kemer", "date": "02.08.2019", "status": "completed"},
  {"location": "Bodrum", "date": "03.08.2018", "status": "completed"},
  {"location": "Marmaris", "date": "04.08.2020", "status": "upcoming"},
  {"location": "Fethiye", "date": "05.08.2020", "status": "upcoming"},
];

List<Map<String, String>> completed =
    stayInfo.where((e) => e['status'] == "completed").toList();

List<Map<String, String>> upcoming =
    stayInfo.where((e) => e['status'] == "upcoming").toList();

var isFilled = false.obs;
RxList data = completed.obs;
Widget hotelInfo(BuildContext context) {
  return Column(children: [
    Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: primaryColor,
      child: Obx(
        () => Row(
          children: [
            FillOutlineButton(
              press: () {
                data.value = completed;
                isFilled.value = !isFilled.value;
              },
              text: "Last Stay",
              isFilled: !isFilled.value,
            ),
            const SizedBox(width: defaultPadding),
            FillOutlineButton(
              press: () {
                data.value = upcoming;
                isFilled.value = !isFilled.value;
              },
              text: "Next Stay",
              isFilled: isFilled.value,
            ),
          ],
        ),
      ),
    ),
    Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 4),
            child: Column(
              children: [
                Info(
                  infoKey: "Location",
                  info: data[index]["location"]!,
                ),
                Info(
                  infoKey: "Date",
                  info: data[index]["date"]!,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ]);
}
