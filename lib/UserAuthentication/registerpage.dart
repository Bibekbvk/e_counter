
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/UserAuthentication/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:lottie/lottie.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _pageAnimation;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameControlller = new TextEditingController();
  TextEditingController confirmpassController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  AuthService authService = new AuthService();
  String url = 'https://assets9.lottiefiles.com/packages/lf20_SmywXC.json';
  FocusNode myFocusNode = new FocusNode();
  Color purcolor = Colors.deepPurpleAccent;
  bool confirmedit = true;
  //Label text defining
  String name = "Full Name";
  String contactnumber = "Contact number";
  String password = "Password";
  String confirmpassword = "Re-enter password";
  String email = 'Email';

  //bordercolors
  Color emailcolor = Colors.grey;
  Color passwordcolor = Colors.grey;
  Color phcolor = Colors.grey;
  Color namecolor = Colors.grey;
  Color confirmpasscolor = Colors.grey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this, value: 0.0)
      ..forward();

    _pageAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    emailController.dispose();
    nameControlller.dispose();
    confirmpassController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.06, 0, size.width * 0.06, size.height * 0.04),
          child: Container(
            width: size.width,
            height: size.height,
            child: ScaleTransition(
              scale: _pageAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            text: 'Create New Account',
                            style: GoogleFonts.laila(
                                textStyle: TextStyle(color: purcolor),
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: "\n Please fill the input below ",
                                  style: GoogleFonts.laila(
                                      textStyle: TextStyle(color: purcolor),
                                      fontSize: size.height * 0.02))
                            ]),
                      ),
                    ),
                  ),

//
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: nameControlller,
                      onChanged: (val) {
                        if (val.length < 3) {
                          setState(() {
                            name = "Please enter valid name";

                            namecolor = Colors.red;
                          });
                        } else if (val.length > 3) {
                          setState(() {
                            namecolor = Colors.green;
                            name = " Valid Name";
                          });
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: decoration(namecolor, name),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        onChanged: (val) {
                          if (EmailValidator.validate(val) == true) {
                            setState(() {
                              email = "Email Valid";
                              emailcolor = Colors.green;
                            });
                          } else {
                            setState(() {
                              emailcolor = Colors.red;
                              email = "Invalid Email";
                            });
                          }
                        },
                        keyboardType: TextInputType.emailAddress,

                        controller: emailController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        // decoration: decoration(emailcolor,email)
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: emailcolor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: emailcolor),
                            ),
                            labelText: email,
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.blue
                                    : emailcolor),
                            hintText: email,
                            prefixIcon: Icon(
                              Icons.email,
                              color: emailcolor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: emailcolor),
                            )),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: phoneController,
                      onChanged: (val) {
                        if (val.length < 10) {
                          setState(() {
                            contactnumber = "Please enter valid contact number";
                            phcolor = Colors.red;
                          });
                        } else if (val.length == 10) {
                          setState(() {
                            phcolor = Colors.green;
                            contactnumber = " Valid Contact Number";
                          });
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      // decoration: decoration(phcolor,contactnumber)
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: phcolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: phcolor),
                          ),
                          labelText: contactnumber,
                          labelStyle: TextStyle(
                              color:
                                  myFocusNode.hasFocus ? Colors.blue : phcolor),
                          hintText: contactnumber,
                          prefixIcon: Icon(
                            FontAwesome.phone,
                            color: phcolor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: phcolor),
                          )),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: passwordController,
                      onChanged: (val) {
                        if (val.length < 7) {
                          setState(() {
                            password = "Please enter valid password";

                            passwordcolor = Colors.red;
                          });
                        } else if (val.length > 7) {
                          setState(() {
                            passwordcolor = Colors.green;
                            password = "Valid Password";
                            confirmedit = false;
                          });
                        }
                      },

                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      // decoration:  decoration(passwordcolor,password),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: passwordcolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: passwordcolor),
                          ),
                          labelText: password,
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : passwordcolor),
                          hintText: password,

                          prefixIcon: Icon(
                            FontAwesome.lock,
                            color: passwordcolor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: passwordcolor),
                          )),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: confirmpassController,
                      readOnly: confirmedit,
                      onChanged: (val) {
                        if (val == passwordController.text) {
                          setState(() {
                            confirmpassword = "Valid";
                            confirmpasscolor = Colors.green;
                          });
                        } else {
                          setState(() {
                            confirmpasscolor = Colors.red;
                            confirmpassword = "Password Doesnot Match";
                          });
                        }
                      },
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      //  decoration:  decoration(confirmpasscolor,confirmpassword),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: confirmpasscolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: confirmpasscolor),
                          ),
                          labelText: confirmpassword,
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : confirmpasscolor),
                          hintText: confirmpassword,
                          prefixIcon: Icon(
                            FontAwesome.lock,
                            color: confirmpasscolor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: confirmpasscolor),
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: purcolor,
                          borderRadius: BorderRadius.circular(5)),
                      width: double.infinity,
                      child: FlatButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          _register();
                          setState(() {
                            if (nameControlller.text.length < 3) {
                              name = "Invalid";
                              namecolor = Colors.red;
                            }
                            if (phoneController.text.length < 10) {
                              contactnumber = "Phone Number Required";
                              phcolor = Colors.red;
                            }

                            if (passwordController.text.length < 7) {
                              password = "Password Required";
                              passwordcolor = Colors.red;
                            }

                            if (emailController.text.isEmpty) {
                              email = "Email Required";
                              emailcolor = Colors.red;
                            }
                            if (confirmpassController.text.isEmpty) {
                              confirmpassword = "Password Required";
                              confirmpasscolor = Colors.red;
                            }

                            url =
                                'https://assets1.lottiefiles.com/packages/lf20_aMwMlF.json';
                          });
                        },
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.7),
                            color: Colors.black54,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: new FlatButton(
                            padding: EdgeInsets.only(
                                top: 3.0, bottom: 3.0, left: 3.0),
                            color: Colors.white,
                            onPressed: () {},
                            child: AutoSizeText(
                              'LOGIN',
                              style: TextStyle(
                                  color: purcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(1.7)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _register() async {
    String emailText = emailController.text;
    String passwordText = passwordController.text;
    String nametext = nameControlller.text;
    if (confirmpassController.text != passwordController.text) {
      flushbar("Invalid", "Passwords Doesnot Match");
      return;
    }
    if (phoneController.text.length < 10) {
      flushbar("PhoneNumber Required", "Please Enter your Phone Number");

      return;
    }
    if (nametext.length < 3) {
      flushbar("Name Required", "Pleaee enter your name");

      return;
    }
    if (passwordController.text.length < 7) {
      flushbar("Password Required", "Please Enter Password");

      return;
    }

    if (emailText.isEmpty) {
      flushbar("Email Required", "Please enter your email");

      return;
    }
    if (passwordText.isEmpty) {
      print("password if");
      flushbar("Password Required", "Please enter your password ");

      return;
    }
    if (emailText.isNotEmpty && passwordText.isNotEmpty) {
      print("in condition");
      var result =
          await authService.registerWithEmailPassword(emailText, passwordText);

      var resultData = result;
      if(resultData is UserCredential){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => e_counter()));
      }
      else{
      flushbar(" ", "${resultData}");}

      return;
    }
  }

  void textfield() {
    TextFormField(
      controller: nameControlller,
      onChanged: (val) {
        if (val.length < 3) {
          setState(() {
            name = "Please enter valid name";

            namecolor = Colors.red;
          });
        } else if (val.length > 3) {
          setState(() {
            namecolor = Colors.green;
            name = " Valid Name";
          });
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: decoration(namecolor, name),
    );
  }

//todo remove this method
  InputDecoration decoration(Color ncolor, String tfname) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ncolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ncolor),
        ),
        labelText: tfname,
        labelStyle:
            TextStyle(color: myFocusNode.hasFocus ? Colors.blue : ncolor),
        hintText: tfname,
        prefixIcon: Icon(
          Icons.person_outline,
          color: ncolor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: ncolor),
        ));
  }

  Flushbar flushbar(
    String title,
    String message,
  ) {
    return Flushbar(
      backgroundColor: Colors.red[600],
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      title: title,
      message: message,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      blockBackgroundInteraction: true,
      dismissDirection: FlushbarDismissDirection.VERTICAL,
    )..show(context);
  }
}
