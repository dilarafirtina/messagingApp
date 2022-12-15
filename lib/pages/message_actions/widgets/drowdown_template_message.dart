import 'package:dropdown_search/dropdown_search.dart';

import '../../../models/template_message.dart';
import '../../../utils/configuration.dart';
import 'package:flutter/material.dart';

Widget templateDropDown(List<TemplateMessageModel> items) {
  return DropdownSearch<TemplateMessageModel>(
    items: items,
    //clearButtonProps: const ClearButtonProps(isVisible: true),
    dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    )),
    popupProps: const PopupProps.menu(
      searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Please enter a search term')),
      showSelectedItems: true,
      itemBuilder: templateWidget,
      showSearchBox: true,
      isFilterOnline: true,
    ),
    // popupProps: const PopupProps.bottomSheet(
    //     showSelectedItems: true,
    //     itemBuilder: templateWidget,
    //     showSearchBox: true,
    //     isFilterOnline: true,
    //     bottomSheetProps: BottomSheetProps(
    //         elevation: 16, backgroundColor: messageBackground)),
    // popupProps: const PopupPropsMultiSelection.modalBottomSheet(
    //   showSelectedItems: true,
    //   itemBuilder: templateWidget,
    //   showSearchBox: true,
    // ),
    // popupProps: const PopupProps.dialog(
    //   showSelectedItems: true,
    //   itemBuilder: templateWidget,
    //   showSearchBox: true,
    // ),
    itemAsString: (TemplateMessageModel v) => v.body,
    filterFn: (item, filter) {
      if (filter.isEmpty) return true;
      if ((item.name?.toLowerCase().contains(filter.toLowerCase()) ??
              "".isEmpty) ||
          (item.body?.toLowerCase().contains(filter.toLowerCase()) ??
              "".isEmpty) ||
          (item.language?.toLowerCase().contains(filter.toLowerCase()) ??
              "".isEmpty)) {
        return true;
      } else {
        return false;
      }
    },
    compareFn: (item, sItem) => item.name == sItem.name,
  );
}

Widget templateWidget(
  BuildContext context,
  TemplateMessageModel item,
  bool isSelected,
) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.body ?? ''),
        leading: returnLanguage(item?.language ?? ""),
      ));
}

Widget returnLanguage(String language) {
  var imageLink = "";
  if (language == "en") {
    imageLink = "images/uk.png";
  } else if (language == "tr") {
    imageLink = "images/tr.png";
  } else if (language == "de") {
    imageLink = "images/de.png";
  } else if (language == "ru") {
    imageLink = "images/ru.png";
  }
  return Column(children: [
    Image.asset(
      imageLink,
      width: 24,
    ),
    Text(language.toUpperCase())
  ]);
}
