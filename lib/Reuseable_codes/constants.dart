import 'package:flutter/material.dart';
List<Color> colorlist = [
  Colors.red,
  Colors.pink,
  Colors.indigo,
  Colors.teal,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.tealAccent

];
int cindex = 0;
Color kPrimaryColor =Colors.deepPurple;
Color kPrimaryLightColor = Colors.purple[400];
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.blue,Color(0xFF42A5f5), ],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
final headingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
