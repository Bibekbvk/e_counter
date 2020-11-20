

import 'package:e_counter/Contactus.dart';
import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/seatgui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
      home:  MyApp(),
    ));}
