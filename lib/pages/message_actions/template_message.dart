import 'package:cht1/models/template_message.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../utils/configuration.dart';
import 'package:flutter/material.dart';
import '../../widgets/form_widgets.dart';
import 'widgets/drowdown_template_message.dart';

Widget templateMessage() {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  return SingleChildScrollView(
      child: Container(
    height: 700,
    padding: const EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding,
        ),
        FormBuilder(
            key: formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    formLabel("Chooose Template"),
                    const SizedBox(
                      height: 8,
                    ),
                    FormBuilderField(
                      onChanged: (value) => {},
                      name: "templateName",
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            child: templateDropDown(templatesList));
                      },
                    ),
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
                  ],
                )),
                const SizedBox(
                  width: AppDefaults.margin,
                ),
                Expanded(
                    child: Column(children: [
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
                        width: AppDefaults.margin,
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
                    ],
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
                              "Parameter 3",
                            ),
                            formInput(
                              "parameter3",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: AppDefaults.margin,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
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
                              "Parameter 5",
                            ),
                            formInput(
                              "parameter5",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: AppDefaults.margin,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () => {},
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(80, 50)),
                                    child: const Text("Save")),
                              )))
                    ],
                  )
                ]))
              ],
            )),
      ],
    ),
  ));
}
