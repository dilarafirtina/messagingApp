import 'package:cht1/models/template_message.dart';
import 'package:cht1/utils/utils.dart';
import 'package:cht1/widgets/default_button.dart';
import 'package:cht1/widgets/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../utils/configuration.dart';
import 'package:flutter/material.dart';
import '../../../widgets/form_widgets.dart';
import 'template_message_list.dart';

Widget templateMessage() {
  var selected = "".obs;
  var dropdownvalue = 'TR'.obs;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: defaultPadding,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: FormBuilderRadioGroup<String>(
          decoration: const InputDecoration(
            labelText: 'Select Message Type',
          ),
          initialValue: 'Template Message',
          wrapAlignment: WrapAlignment.spaceBetween,
          name: 'messageType',
          onChanged: ((value) {}),
          options: [
            'Template Message',
            'Instant Message',
            'Tag',
          ]
              .map((message) => FormBuilderFieldOption(
                    value: message,
                    child: Text(message),
                  ))
              .toList(growable: false),
          controlAffinity: ControlAffinity.leading,
        ),
      ),
      const SizedBox(
        height: defaultPadding,
      ),
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: FormBuilderDropdown(
                name: 'language',
                decoration: const InputDecoration(
                  labelText: 'Select Language',
                ),
                initialValue: languages[0][text],
                onChanged: (value) {
                  print(value);
                },
                items: languages
                    .map((language) => DropdownMenuItem(
                          value: language["text"],
                          child: Row(children: [
                            Image.asset(
                              language["image"]!,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(language["text"]!)
                          ]),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: defaultPadding,
      ),
      SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: templatesList.length,
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              templateList(templatesList[index], () {
            selected.value = templatesList[index].body;

            formKey.currentState!.fields['message']!.didChange(selected.value);
          }),
        ),
      ),
      const SizedBox(
        height: defaultPadding,
      ),
      Obx(
        () => selected.value.isNotEmpty
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          formLabel(
                            "Message",
                          ),
                          formInputArea(
                            "message",
                          ),
                          formLabel(
                            "Parameter Header",
                          ),
                          formInput(
                            "header",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    formLabel(
                                      "Parameter 1",
                                    ),
                                    formInput(
                                      "parameter1",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    formLabel(
                                      "Parameter 2",
                                    ),
                                    formInput(
                                      "parameter2",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    formLabel(
                                      "Parameter 3",
                                    ),
                                    formInput(
                                      "parameter3",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      formLabel(
                                        "Parameter 4",
                                      ),
                                      formInput(
                                        "parameter4",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      formLabel(
                                        "Parameter 5",
                                      ),
                                      formInput(
                                        "parameter5",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      formLabel(
                                        "Parameter 6",
                                      ),
                                      formInput(
                                        "parameter6",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: defaultButton(text: "Save")),
                              ],
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ),
    ],
  );
}
