import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

//Style
class ColorConstants {
  static Color gray50 = hexToColor('#e9e9e9');
  static Color gray100 = hexToColor('#bdbebe');
  static Color gray200 = hexToColor('#929293');
  static Color gray300 = hexToColor('#666667');
  static Color gray400 = hexToColor('#505151');
  static Color gray500 = hexToColor('#242526');
  static Color gray600 = hexToColor('#202122');
  static Color gray700 = hexToColor('#191a1b');
  static Color gray800 = hexToColor('#121313');
  static Color gray900 = hexToColor('#0e0f0f');
}

const kPrimaryColor = Color(0xFF128C7E);
const kSecondaryColor = Color(0xFF075e54);
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

const kAnimationDuration = Duration(milliseconds: 200);

const kLightBlue = Color(0xFF0071a7);
const kDarkblue = Color(0xFF003557);

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

const double maxWidth = 480.0;

class AppDefaults {
  static const double radius = 15;
  static const double margin = 15;
  static const double padding = 15;

  /// Used For Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  /// Used For Bottom Sheet
  static BorderRadius bottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Used For Top Sheet
  static BorderRadius topSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Default Box Shadow used for containers
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.04),
    ),
  ];

  static Duration duration = const Duration(milliseconds: 300);
}

//Ela için false else demo için
var demo = false;

var companyId = demo ? 1 : 27;
var tenantId = demo ? 1 : 12;
var apiEndpoint =
    demo ? "https://demo.opex.app:8101/" : "https://mysvc.opex.app:9000/ ";
final String apiToken = demo
    ? "guestappapi#1\$e1603a8f46562c51e463758e99e4f8f550e124d1a65dbd2a9b0a6826a121299b9461ac8cb40db4a03f13a50228734e6a7b820ac5093f5c8277cebad35e804f36"
    : "guestappapi#12\$cd34630a75b1ba2878e7d3b03fc54f20b8edc1895a2cb804e0e1bdf4496d2f796ed16cd996eae9eeea11d9ebae277a590c9aebe99bb056d1c2ca081397ca4459";
//guestappapi#1$e1603a8f46562c51e463758e99e4f8f550e124d1a65dbd2a9b0a6826a121299b9461ac8cb40db4a03f13a50228734e6a7b820ac5093f5c8277cebad35e804f36
//guestapp#5$7e87b01df802ebfdfa1dbaec3c1ea54d68844f17b2888f321b356ea1ea556798406e1b8fe0639b59a87b311c26f0d4c597eebae90078746ceec6c7a3942877e7
//Edit Text
// class TypeableTextFormField extends StatefulWidget {
//   final int? maxLines;
//   final String? finalText;
//   final InputDecoration? decoration;
//   final Animation<double>? animation;

//   const TypeableTextFormField(
//       {Key? key,
//       this.animation,
//       this.maxLines,
//       this.decoration,
//       this.finalText})
//       : super(key: key);

//   @override
//   TypeableTextFormFieldState createState() {
//     return TypeableTextFormFieldState();
//   }
// }

/*fonts*/
const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';
/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 28.0;
const textSizeXXLarge = 30.0;

const headline1 = TextStyle(
    fontSize: 18.0, color: kPrimaryColor, fontWeight: FontWeight.w400);
const headline4 = TextStyle(
    fontSize: 15.0, color: kPrimaryColor, fontWeight: FontWeight.w400);
const headline6 = TextStyle(
    fontSize: 13.0, color: Colors.black38, fontWeight: FontWeight.w400);
const subtitle1 = TextStyle(
    fontSize: 18.0, color: Colors.black87, fontWeight: FontWeight.w400);
const subtitle2 = TextStyle(
    fontSize: 18.0, color: kPrimaryColor, fontWeight: FontWeight.w400);
const bodyText2 = TextStyle(fontSize: 15.0);
const bodyText1 = TextStyle(fontSize: 25.0, color: kPrimaryColor);

//Icons
final appIcons = <String, IconData>{
  'star': Icons.star,
  'hand': Icons.handshake,
  'shuttle-van': Icons.airport_shuttle,
  'alarm-sharp': Icons.alarm,
  'tools': Icons.handyman,
  'laundry': Icons.local_laundry_service,
  'roomservice': Icons.room_service,
  'dry-cleaning': Icons.dry_cleaning,
  "female": Icons.female,
  "signature": Icons.edit,
  "hotel": Icons.hotel,
  "concierge_bell": Icons.room_service,
  "calendar": Icons.calendar_today,
  "user": Icons.person,
  "search": Icons.search,
  "door_open": Icons.door_front_door,
  "login": Icons.login,
  "logout": Icons.logout,
  "account": Icons.person,
  "survey": Icons.question_mark,
  "contact": Icons.contact_phone,
  "comment": Icons.comment,
  "navigation": Icons.navigation,
  "packages": Icons.star,
  "spa": Icons.spa,
  "rooms": Icons.bed,
  "services": Icons.category,
  "language": Icons.language,
  "houseKeeping": Icons.cleaning_services,
  "babySitter": Icons.baby_changing_station,
  "lateCheckout": Icons.lock_clock,
  "restraurant": Icons.restaurant,
};

//Task colors
final appColors = <String, Color>{
  'lost': Colors.yellow,
  'roomrack': Colors.blue,
  'comment': Colors.green,
  'survey': Colors.green,
  'guest': Colors.cyan,
  'dashboard': Colors.black,
  'reservation': Colors.orange,
  'form': Colors.purple,
  'grey': Colors.grey,
  'task': Colors.red
};

final taskColors = <int, Color>{
  1: Colors.blue, //new
  2: Colors.yellow, //in progress
  3: Colors.orange, //plan
  4: Colors.green, // completed
  5: Colors.green, //confirmed
  6: Colors.grey, //cancel
  7: Colors.purple, //reopen
  8: Colors.teal, // redirect
  9: Colors.indigo, // notified
};
