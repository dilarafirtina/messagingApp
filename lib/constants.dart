import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const primaryColor = Color(0xFF25d366);
const secondaryColor = Color(0xFF075e54);
const textBoxMe = Color(0xFFdcf8c6);
const messageBackground = Color(0xFFece5dd);
const contentColorLightTheme = Color.fromRGBO(29, 29, 53, 1);
const contentColorDarkTheme = Color(0xFFF5FCF9);
const warninngColor = Color(0xFFF3BB1C);
const errorColor = Color(0xFFF03738);

const defaultPadding = 16.0;

const logoDarkTheme = "icons/Only_logo_dark_theme.svg";
const logoLightTheme = "icons/Only_logo_light_theme.svg";

const requiredField = "This field is required";
const invalidEmail = "Enter a valid email address";

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: requiredField),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ],
);

const InputDecoration otpInputDecoration = InputDecoration(
  filled: false,
  border: UnderlineInputBorder(),
  hintText: "0",
);

enum MenuState { chat, services, reservations, offers }

const String logoImage = "https://yasmak.opex.app/images/logo.png";
