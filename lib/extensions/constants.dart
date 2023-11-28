// useMaterial3: true,
import 'package:flutter/material.dart';

var primaryColor = Color(0xFF3Ebace);
var hintColor = Color(0xffd8ecf1);
var scaffoldBackgroundColor = Color(0xfff3f5f7);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const kTextColor = Color(0xff757575);
const kPrimaryColor = Color(0xff8588ff);
const kSecondaryColor = Color(0xfffffc85);
const kAccentColor = Color(0xffcac505);

class HotelAppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: fontName),
    );
  }
}
