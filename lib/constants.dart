import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const primaryColor = Color(0xFF128C7E);
const secondaryColor = Color(0xFF075e54);
const textBoxMe = Color(0xFFdcf8c6);
const blueColor = Color(0xFF34B7F1);
const messageBackground = Color(0xFFece5dd);
const contentColorLightTheme = Color.fromRGBO(29, 29, 53, 1);
const greyColor = Color(0xFFf9f9f9);
const warninngColor = Color(0xFFF3BB1C);
const errorColor = Color(0xFFF03738);

const defaultPadding = 16.0;

const logoDarkTheme = "icons/logo.svg";
const logoLightTheme = "icons/logo.svg";

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

enum MenuState { queue, accepted, resolved }

const String logoImage = "https://yasmak.opex.app/images/logo.png";
