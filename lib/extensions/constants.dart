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
      displayMedium: base.displayMedium?.copyWith(fontFamily: fontName),
      displaySmall: base.displaySmall?.copyWith(fontFamily: fontName),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontName),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontName),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontName),
      labelLarge: base.labelLarge?.copyWith(fontFamily: fontName),
      bodySmall: base.bodySmall?.copyWith(fontFamily: fontName),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontName),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontName),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontName),
      titleSmall: base.titleSmall?.copyWith(fontFamily: fontName),
      labelSmall: base.labelSmall?.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    const Color primaryColor = Color(0xff54d3c2);
    const Color secondaryColor = Color(0xff54d3c2);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light(); 
    return base.copyWith(
      primaryColor: primaryColor, 
      indicatorColor: Colors.white, 
      splashColor: Colors.white24, 
      splashFactory: InkRipple.splashFactory, 
      canvasColor: Colors.white,  
      scaffoldBackgroundColor: Color(0xfff6f6f6), 
      buttonTheme: ButtonThemeData(colorScheme: colorScheme, textTheme: ButtonTextTheme.primary), 
      textTheme: _buildTextTheme(base.textTheme), 
      primaryTextTheme: 
    )
  }
}
