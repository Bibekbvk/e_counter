

import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/Reuseable_codes/theme.dart';
import 'package:e_counter/seatgui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  runApp(


    MyApp());}

class MyApp extends StatelessWidget {
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
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('purple');
          } else {
            controller.setTheme('light');
          }
          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        AppTheme.light(id: 'light'),
        AppTheme.dark(id: 'dark'),
        AppTheme.purple(id:"purple"),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,

            home: e_counter(),
          ),
        ),
      ),
    );
  }
}