import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.grey;
Color kPrimaryColorLight = Colors.white;
Color kSecondaryColorLight = Colors.white38;
Color kPrimaryColorDark = Colors.black;
Color kSecondaryColorDark = Colors.black87;

ThemeData themeData() {
  final TextStyle _textStyle = TextStyle(color: kPrimaryColorDark);
  final TextTheme _textTheme = TextTheme(
      headline6: _textStyle,
      headline5: _textStyle.copyWith(color: kPrimaryColorLight),
      headline4: _textStyle.copyWith(fontSize: 18),
      headline3: _textStyle.copyWith(fontSize: 24),
      subtitle1: _textStyle.copyWith(
          fontWeight: FontWeight.bold, color: kPrimaryColorLight),
      subtitle2: _textStyle,
      bodyText1: _textStyle.copyWith(
          fontWeight: FontWeight.bold, color: kPrimaryColorLight),
      bodyText2: _textStyle);

  return ThemeData(
    canvasColor: kSecondaryColorLight,
    primarySwatch: Colors.grey,
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColorLight,
    primaryColorDark: kPrimaryColorDark,
    textTheme: _textTheme,
    iconTheme: IconThemeData(color: kPrimaryColorDark),
    appBarTheme: AppBarTheme(
      color: kPrimaryColorLight,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: _textTheme.headline3,
    ),
  );
}
