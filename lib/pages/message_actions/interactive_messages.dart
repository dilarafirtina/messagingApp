import 'package:cht1/models/template_message.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../utils/configuration.dart';
import 'package:flutter/material.dart';
import '../../widgets/form_widgets.dart';
import 'widgets/drowdown_template_message.dart';

Widget interactiveMessage() {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  return Container(
    height: double.infinity,
    width: double.infinity,
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
            child: Column(children: [
              formLabel("Choose Template"),
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
                      child: templateDropDown(interactiveMessageList));
                },
              ),
              formLabel(
                "Message",
              ),
              formInputArea(
                "message",
              ),
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(80, 40)),
                    child: const Text("Save")),
              )
            ])),
      ],
    ),
  );
}
