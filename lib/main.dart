

import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:e_counter/Reuseable_codes/theme.dart';
import 'package:e_counter/UserAuthentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_provider/theme_provider.dart';
Widget checkwidget = LogInPage();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String check = prefs.getString('login');
  if(check=="yes"){
    checkwidget= e_counter();
  }
  else{
    checkwidget=e_counter();
  }
  print(check);
  runApp(MaterialApp


    (debugShowCheckedModeBanner: false,
      home: MyApp()));}

class MyApp extends StatelessWidget {

  static final String customAppThemeId = 'custom_theme';
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {

        String savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              SchedulerBinding.instance.window.platformBrightness;
          controller.addTheme(customAppTheme());

            controller.setTheme('custom_theme');


        }
      },
      themes: <AppTheme>[
        AppTheme.light(id: 'light'),
        AppTheme.dark(id: 'dark'),

      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,

            home: checkwidget,
          ),
        ),
      ),
    );
  }
  AppTheme customAppTheme() {
    return AppTheme(
      id: customAppThemeId,
      description: "Custom Color Scheme",
      data: ThemeData(
        accentColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        buttonColor: kPrimaryColor,
        dialogBackgroundColor: kPrimaryColor,
       textTheme: GoogleFonts.cherryCreamSodaTextTheme(

       ),
    ),);
  }

}