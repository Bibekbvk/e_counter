import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "GoogleFonts.laBelleAurore",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),

    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(

    hintStyle: TextStyle(color: kPrimaryColor),
    errorStyle: TextStyle(color: Colors.red),
    prefixStyle: TextStyle(color: kPrimaryColor),
    suffixStyle: TextStyle(color: kPrimaryColor),
    labelStyle:TextStyle(color: kPrimaryColor) ,
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kPrimaryColor),
    bodyText2: TextStyle(color: kPrimaryLightColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(

    color: Colors.blue[700],
    elevation: 0,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}