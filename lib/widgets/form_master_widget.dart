import 'package:cht1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../utils/configuration.dart';
import 'form_widgets.dart';
import 'round_backgroud_button.dart';

Widget formMaster(
    {required String title,
    required GlobalKey<FormBuilderState> key,
    Map<String, dynamic>? formData,
    required Function()? onTap,
    required List<Widget> children}) {
  return limitScreen(Scaffold(
    body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: kLightBlue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              backGoundRoundButton(
                top: 5,
                left: 5,
                bottom: 5,
                right: 0,
              ),
              Container(
                width: 330,
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Text(
                  title.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            FormBuilder(
                              key: key,
                              child: Column(children: children),
                            ),
                            formSaveButton(onTap)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
