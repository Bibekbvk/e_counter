import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_counter/Book.dart';
import 'package:e_counter/Homepage.dart';
import 'package:e_counter/offers.dart';
import 'package:e_counter/registerpage.dart';
import 'package:e_counter/seatgui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_counter/auth.dart';
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
  AnimationController _backgroundController;
  AnimationController _contentController;
  Animation<Offset> _backgroundOffset;
  Animation<Offset> _contentOffset;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _backgroundController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward();
    _contentController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..forward();
    _backgroundOffset = Tween<Offset>(
      begin: Offset(0, 4),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: _backgroundController, curve: Curves.slowMiddle));
    _contentOffset = Tween<Offset>(
      begin: Offset(0, 1.1),
      end: Offset(0.0, 0.0),
    ).animate(
        CurvedAnimation(parent: _contentController, curve: Curves.bounceInOut));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _backgroundController.dispose();
    _contentController.dispose();
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            SlideTransition(
              position: _backgroundOffset,
              child: Container(
                width: double.infinity,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/login_background.png"),
                        fit: BoxFit.fill)),
//                  child: Image(
//                    image: AssetImage("images/login_background.png"),fit: BoxFit.contain,
//                  ),
              ),
            ),
            SlideTransition(
              position: _contentOffset,
              child: SingleChildScrollView(
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
                                    color: Colors.black26,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 20),
                                  fillColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
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
                                    color: Colors.black26,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                  fillColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
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
                                    color: Colors.blue,
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
                                color: Colors.blue,
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
                                      if (result is User)
                                        Flushbar(
                                          backgroundColor: Colors.green[600],
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          flushbarStyle: FlushbarStyle.FLOATING,
                                          message: "User Logged In",
                                          duration: Duration(seconds: 2),
                                          margin: EdgeInsets.all(8),
                                          borderRadius: 8,
                                          blockBackgroundInteraction: true,
                                          dismissDirection:
                                              FlushbarDismissDirection.VERTICAL,
                                        )..show(context);
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
                          Expanded(
                            flex: 1,
                            child: Row(children: <Widget>[
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Divider(
                                      thickness:
                                          MediaQuery.of(context).size.height *
                                              0.001,
                                      color: Colors.black54,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                    )),
                              ),
                              AutoSizeText(
                                "OR",
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.3),
                                    color: Colors.black54),
                              ),
                              Expanded(
                                child: new Container(
                                    margin: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Divider(
                                      color: Colors.black54,
                                      thickness:
                                          MediaQuery.of(context).size.height *
                                              0.001,
                                      height: 20,
                                    )),
                              ),
                            ]),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(child: GoogleSignInButton(
                              onPressed: () {/* ... */},
                              // default: false
                            )),
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
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(1.7)),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => seatGui()));
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
