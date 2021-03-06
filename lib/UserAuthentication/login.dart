
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_counter/Book.dart';
import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/Homepage/Register.dart';
import 'package:e_counter/Models/auth_model.dart';
import 'package:e_counter/UserAuthentication/auth.dart';
import 'package:e_counter/UserAuthentication/registerpage.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:garageinc/core/services/database.dart';
//import 'package:garageinc/ui/views/register/registerpage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:toast/toast.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with TickerProviderStateMixin {
  // DatabaseService total_products = DatabaseService();
  //final db = DatabaseService();



  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passController = TextEditingController();

  String email = '';
  String password = '';
  String error = '';
  String b = "";
  Color purcolor = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                children: [

                  Container(

                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDe4nlATrSg_eYenOjdxWcYWQFRzbMh0a9hg&usqp=CAU"),
                            ),

                    ),
                  ),
                  Text("E-Counter", style: GoogleFonts.laBelleAurore(color: Colors.deepPurpleAccent,  fontSize: 34, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.06, 0,
                    size.width * 0.06, size.height * 0.04),

                child: Container(
                  width: size.width,
                  height: size.height,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.32,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: purcolor,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),),
                                fillColor: Colors.white,

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: purcolor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 6.0)),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(

                                  Icons.lock,
                                  color: purcolor,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(

                                ),
                                fillColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: purcolor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 16.0)),
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () =>
                                  print('Forgot Password Button Pressed'),
                              child: AutoSizeText(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: purcolor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.008,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: RaisedButton(
                              color: purcolor,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.signInWithEmailPassword(
                                          email, password);
                                  if (email.isEmpty) {
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
                                      dismissDirection:
                                          FlushbarDismissDirection.VERTICAL,
                                    )..show(context);
                                    return;
                                  }
                                  if (password.isEmpty) {
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
                                      dismissDirection:
                                          FlushbarDismissDirection.VERTICAL,
                                    )..show(context);
                                    return;
                                  }
                                  if (result != null) {

                                    if (result is AuthModel){


                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => e_counter()));

                                    }

                                    else {

                                      Flushbar(
                                        backgroundColor: Colors.red[600],
                                        flushbarPosition:
                                            FlushbarPosition.TOP,
                                        flushbarStyle: FlushbarStyle.FLOATING,
                                        message: result.toString(),
                                        duration: Duration(seconds: 2),
                                        margin: EdgeInsets.all(8),
                                        borderRadius: 8,
                                        blockBackgroundInteraction: true,
                                        dismissDirection:
                                            FlushbarDismissDirection.VERTICAL,
                                      )..show(context);
                                    }
                                  }
                                }
                              },
                              elevation: 11,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: AutoSizeText("Login",
                                  style: GoogleFonts.lato(
                                      textStyle:
                                          TextStyle(color: Colors.white),
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),



                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(1.7),
                                  color: Colors.black54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              FlatButton(
                                child: AutoSizeText(
                                  "Register",
                                  style: TextStyle(
                                      color: purcolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.7)),
                                ),
                                onPressed: () {
                                  setState(() {});
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()));
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(flex: 3,
                          child: Container(

                          ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
