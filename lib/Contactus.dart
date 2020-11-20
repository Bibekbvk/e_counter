import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.orange.withOpacity(0.8),
          leading: Icon(Icons.arrow_back_ios_sharp, size: 20,
          ),
          title: Center(child: Text('Contact Us')),
        ),
        
        body: Column(
          children: [

            ContactUs(
              email: 'raieshgmail.com',
              companyName: 'E-Counter',
              phoneNumber: '+9779817931246',

              tagLine: 'Contact Us For More Information',
              facebookHandle: '',
            ),

          ],
        ),
      ),
    );
  }
}