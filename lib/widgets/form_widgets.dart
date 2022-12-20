import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../models/lookup_item_model.dart';
import '../theme/Themes.dart';
import '../utils/configuration.dart';
import 'default_button.dart';
import 'widgets.dart';

Widget formLabel(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    alignment: Alignment.topLeft,
    child: subTitle(label.tr),
  );
}

Widget formInput(String field,
    {IconData? suffixIcon, bool? isRequired, dynamic initialValue}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderTextField(
        name: field,
        initialValue: initialValue,
        decoration: InputDecoration(
          suffixIcon: Icon(suffixIcon), //Icons.check
        ),
        // valueTransformer: (text) {
        //   return text == null ? null : num.tryParse(text);
        // },
        validator: isRequired ?? false == true
            ? FormBuilderValidators.compose([FormBuilderValidators.required()])
            : null,
        //validators: validators ?? [],
        //readOnly: readonly ?? false,
        //keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ));
}

Widget formInputInt(String field, {IconData? suffixIcon, bool? isRequired}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderTextField(
          textAlign: TextAlign.right,
          name: field,
          decoration: InputDecoration(
            //labelText: "label".tr,
            suffixIcon: Icon(suffixIcon), //Icons.check
          ),
          valueTransformer: (text) => num.tryParse(text ?? "0"),
          validator: isRequired ?? false == true
              ? FormBuilderValidators.compose(
                  [FormBuilderValidators.required()])
              : null,
          //validators: validators ?? [],
          //readOnly: readonly ?? false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next));
}

Widget formInputDouble(String field, {IconData? suffixIcon, bool? isRequired}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderTextField(
          textAlign: TextAlign.right,
          name: field,
          decoration: InputDecoration(
            //labelText: "label".tr,
            suffixIcon: Icon(suffixIcon), //Icons.check
          ),
          valueTransformer: (text) => num.tryParse(text ?? "0.00"),
          validator: isRequired ?? false == true
              ? FormBuilderValidators.compose(
                  [FormBuilderValidators.required()])
              : null,
          //validators: validators ?? [],
          //readOnly: readonly ?? false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next));
}

Widget formSwitch(String label, String fieldName, {bool? enabled}) {
  return FormBuilderSwitch(
    activeColor: kPrimaryColor,
    activeTrackColor: ColorConstants.gray100,
    inactiveThumbColor: ColorConstants.gray300,
    inactiveTrackColor: ColorConstants.gray100,
    title: Text(label, style: lightTheme.textTheme.subtitle1),
    name: fieldName,
    enabled: enabled ?? true,
  );
}

Widget formPassword(String field, bool? obscureText,
    {IconData? suffixIcon, VoidCallback? onTap}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderTextField(
          name: field,
          decoration: InputDecoration(
              suffixIcon: IconButton(
            onPressed: onTap,
            icon: Icon(obscureText == true ? Icons.lock : Icons.lock_open),
          )),
          obscureText: obscureText ?? true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(6),
          ]),
          textInputAction: TextInputAction.next));
}

Widget formInputArea(String field, {IconData? suffixIcon, int? maxLines}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderTextField(
          name: field,
          maxLines: maxLines ?? 5,
          decoration: const InputDecoration(
              //labelText: "label".tr,
              //suffixIcon: IconButton(onPressed Icons.cancel),
              //suffixIconColor: kPrimaryColor, //Icons.check
              ),
          textInputAction: TextInputAction.next));
}

Widget formBuilderTouchSpin(String name, GlobalKey<FormBuilderState> formKey,
    {int? initialValue,
    int? step,
    int? min,
    int? max,
    Function(String?)? onChanged}) {
  return FormBuilderTextField(
    textAlign: TextAlign.center,
    name: name,
    readOnly: true,
    onChanged: onChanged,
    valueTransformer: (text) => num.tryParse(text ?? "0"),
    decoration: InputDecoration(
      suffixIcon: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          int value = 0;
          if (formKey.currentState!.fields[name] != null) {
            value = int.tryParse(
                    formKey.currentState!.fields[name]!.value.toString()) ??
                0;
          }
          if (max != null) {
            if (value >= max) {
              return;
            }
          }
          value = value + (step ?? 1);
          formKey.currentState!.fields[name]?.didChange(value.toString());
        },
      ),
      prefixIcon: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () {
          int value = 0;
          if (formKey.currentState!.fields[name] != null) {
            value = int.tryParse(
                    formKey.currentState!.fields[name]!.value.toString()) ??
                0;
          }
          if (min != null) {
            if (value <= min) {
              return;
            }
          }
          value = value - (step ?? 1);
          formKey.currentState!.fields[name]?.didChange(value.toString());
        },
      ),
    ),
    initialValue: initialValue.toString(),
    keyboardType: TextInputType.number,
  );
}

Widget formDropdown(String field, List<LookupItem> items,
    {Function(int?)? onChanged}) {
  return FormBuilderDropdown(
      // autovalidate: true,
      name: field,
      decoration: const InputDecoration(
          //suffix: const Icon(Icons.check),
          ),
      //allowClear: true,
      //hint: Text('Select value'.tr),
      onChanged: onChanged,
      // validator: FormBuilderValidators.compose(
      //     [FormBuilderValidators.required(context)]),
      items: items
          .map((item) => DropdownMenuItem(
                value: item.id,
                child: Text(item.lookupText),
              ))
          .toList());
}

Widget formDropdownRequired(String field, List<LookupItem> items,
    {Function(int?)? onChanged}) {
  return FormBuilderDropdown(
      // autovalidate: true,
      name: field,
      decoration: InputDecoration(
        //suffix: const Icon(Icons.check),
        hintText: 'Select value'.tr,
      ),
      onChanged: onChanged,
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      items: items
          .map((item) => DropdownMenuItem(
                value: item.id,
                child: Text(item.lookupText),
              ))
          .toList());
}

Widget formMaterialDatePicker(String dataField,
    {dynamic initialValue, dynamic minDate}) {
  return FormBuilderDateTimePicker(
    name: dataField,
    initialValue: initialValue ?? DateTime.now(),
    inputType: InputType.date,
    decoration: const InputDecoration(
      suffix: Icon(Icons.check),
    ),
    firstDate: DateTime(1900, 1, 1),
    //initialTime: TimeOfDay(hour: 8, minute: 0),
    //pickerType: PickerType.cupertino,
    format: DateFormat("yyyy-MM-dd"),
    //locale: Locale.fromSubtags(languageCode: 'es'),
  );
}

formDatePicker(
    String dataField, InputType inputType, GlobalKey<FormBuilderState> formKey,
    {dynamic initialValue, dynamic minDate, dynamic maxDate}) {
  return defaultTargetPlatform == TargetPlatform.iOS
      ? FormBuilderCupertinoDateTimePicker(
          name: dataField,
          initialValue: initialValue,
          firstDate: minDate,
          lastDate: maxDate,
          inputType: inputType == InputType.date
              ? CupertinoDateTimePickerInputType.date
              : inputType == InputType.time
                  ? CupertinoDateTimePickerInputType.time
                  : CupertinoDateTimePickerInputType.both,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: const Icon(Icons.close, size: 16),
                onPressed: () {
                  formKey.currentState!.fields[dataField]?.didChange(null);
                }),
          ),
          locale: Get.locale,
        )
      : FormBuilderDateTimePicker(
          name: dataField,
          initialValue: initialValue,
          firstDate: minDate,
          lastDate: maxDate,
          inputType: inputType, //InputType.time,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: const Icon(Icons.close, size: 16),
                onPressed: () {
                  formKey.currentState!.fields[dataField]?.didChange(null);
                }),
          ),
          initialTime: const TimeOfDay(hour: 8, minute: 0),
          locale: Get.locale,
        );
}

Widget formSaveButton(Function()? onTap) {
  return defaultButton(press: onTap, text: 'Continue'.tr);
}

Widget formNote(String text) {
  return Align(alignment: Alignment.centerRight, child: Text(text.tr));
}
