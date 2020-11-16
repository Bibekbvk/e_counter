//TODO: Need Message Handling

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:e_counter/auth.dart';
//import 'package:garageinc/core/services/database.dart';

class RegisterUserEmailPassword extends StatefulWidget {
  @override
  _RegisterUserEmailPasswordState createState() =>
      _RegisterUserEmailPasswordState();
}

class _RegisterUserEmailPasswordState extends State<RegisterUserEmailPassword> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "Email",
                  hintText: "example@example.com",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1)),
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    color: Color(0xff03A9F4),
                    onPressed: () {
                      _register();
                    },
                    elevation: 11,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child:
                        Text("Register", style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _register() async {
    String emailText = emailController.text;
    String passwordText = emailController.text;
    if (emailText.isEmpty) {
      Flushbar(
        backgroundColor: Colors.red[600],
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        title: "Email Required",
        message: "Please enter your email",
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        blockBackgroundInteraction: true,
        dismissDirection: FlushbarDismissDirection.VERTICAL,
      )..show(context);
      return;
    }
    if (passwordText.isEmpty) {
      print("password if");
      Flushbar(
        backgroundColor: Colors.red[600],
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        title: "Password Required",
        message: "Please enter your password",
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        blockBackgroundInteraction: true,
        dismissDirection: FlushbarDismissDirection.VERTICAL,
      )..show(context);
      return;
    }
    if (emailText.isNotEmpty && passwordText.isNotEmpty) {
      print("in condition");
      var result =
          await authService.registerWithEmailPassword(emailText, passwordText);
      var resultData = result;

      Flushbar(
        backgroundColor: Colors.red[600],
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        message: "$resultData",
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        blockBackgroundInteraction: true,
        dismissDirection: FlushbarDismissDirection.VERTICAL,
      )..show(context);
      return;
    }
  }
}
