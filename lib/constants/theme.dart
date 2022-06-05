import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.blue;
Color kPrimaryColorLight = Colors.white54;
Color kPrimaryColorDark = Colors.black54;

ThemeData themeData() {
  final TextStyle _textStyle = TextStyle(color: kPrimaryColorDark);
  final TextTheme _textTheme = TextTheme(
      headline6: _textStyle,
      headline5: _textStyle.copyWith(color: Colors.white),
      headline4: _textStyle.copyWith(fontSize: 18),
      subtitle1:
          _textStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      subtitle2: _textStyle,
      bodyText1:
          _textStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      bodyText2: _textStyle);

  return ThemeData(
    canvasColor: kPrimaryColorLight,
    primarySwatch: Colors.blue,
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColorLight,
    primaryColorDark: kPrimaryColorDark,
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      color: kPrimaryColor,
      elevation: 10,
      centerTitle: true,
      titleTextStyle: _textTheme.headline5,
    ),
  );
}
