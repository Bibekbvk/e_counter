import 'package:e_counter/About.dart';
import 'package:e_counter/Homepage.dart';
import 'package:e_counter/districts_search.dart';
import 'package:e_counter/login.dart';
import 'package:e_counter/showvehicles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
      home: e_counter(),
    ));}
