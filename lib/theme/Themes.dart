import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/configuration.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: appBarTheme,
  iconTheme: const IconThemeData(color: contentColorLightTheme),
  textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme)
      .apply(bodyColor: contentColorLightTheme),
  colorScheme: const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    error: errorColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: contentColorLightTheme.withOpacity(0.7),
    unselectedItemColor: contentColorLightTheme.withOpacity(0.32),
    selectedIconTheme: const IconThemeData(color: kPrimaryColor),
    showUnselectedLabels: true,
  ),
  inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF4F4F4),
      focusColor: Color(0xFFF4F4F4),
      hoverColor: Color(0xFFF4F4F4),
      labelStyle: TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 186, 185, 185)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide:
            BorderSide(style: BorderStyle.solid, color: Color(0xFFcecece)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide:
            BorderSide(style: BorderStyle.solid, color: Color(0xFFcecece)),
      )),
);

ThemeData darkTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: contentColorLightTheme,
  appBarTheme: appBarTheme,
  iconTheme: IconThemeData(color: greyColor),
  textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
      .apply(bodyColor: contentColorLightTheme),
  colorScheme: ColorScheme.dark().copyWith(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    error: errorColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: contentColorLightTheme,
    selectedItemColor: Colors.white70,
    unselectedItemColor: greyColor.withOpacity(0.32),
    selectedIconTheme: IconThemeData(color: kPrimaryColor),
    showUnselectedLabels: true,
  ),
  inputDecorationTheme: inputDecorationTheme,
);

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: greyColor.withOpacity(0.04),
  // contentPadding: EdgeInsets.symmetric(
  //     horizontal: defaultPadding * 1.5, vertical: defaultPadding),
  // border: OutlineInputBorder(
  //   borderSide: BorderSide.none,
  //   borderRadius: const BorderRadius.all(Radius.circular(50)),
  // ),
);
