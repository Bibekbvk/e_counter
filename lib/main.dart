

import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/Reuseable_codes/theme.dart';
import 'package:e_counter/UserAuthentication/login.dart';
import 'package:e_counter/seatgui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    theme: theme(),
      home: e_counter(),
    ));}
