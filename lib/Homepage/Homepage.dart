import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_counter/Contactus.dart';
import 'package:e_counter/Homepage/Contact.dart';
import 'package:e_counter/Homepage/Fair.dart';
import 'package:e_counter/Homepage/Movers.dart';
import 'package:e_counter/Homepage/Register.dart';
import 'package:e_counter/Homepage/Reserve/ViewReserve.dart';
import 'package:e_counter/Homepage/TicketBooking/Choose_Booking.dart';
import 'package:e_counter/Homepage/my_tickets.dart';
import 'package:e_counter/Homepage/offers.dart';
import 'package:e_counter/Homepage/rent.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:e_counter/UserAuthentication/login.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'About.dart';
import '../Book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class e_counter extends StatefulWidget {
  @override
  _e_counterState createState() => _e_counterState();
}
class _e_counterState extends State<e_counter> {
  SharedPreferences prefs;
  static final String customAppThemeId = 'custom_theme';
  ScrollController _scrollController = new ScrollController();
  @override
  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', "yes");



  }

  Widget build(BuildContext context) {
    drawer:Drawer(
      elevation:33,
      child:ListView(
        children:[





        ]



      )

    );
    init();
    List<Widget> services = [
      InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      offers()));
        },
        child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqJMqbFacvHMv1_tqVjGVcZ1DxEo7uQf1Q-g&usqp=CAU"),
      ),
      InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      offers()));
        },
        child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdUpin4uY98l5G_XN_zztinOEZLPQlpI8cog&usqp=CAU"),
      ),
      InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      offers()));
        },
        child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqJMqbFacvHMv1_tqVjGVcZ1DxEo7uQf1Q-g&usqp=CAU"),
      )
    ];
    Timer(
      Duration(seconds: 2),
      () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 25),
        curve: Curves.fastOutSlowIn,
      ),
    );
    Timer(
      Duration(seconds: 29),
          () => _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: Duration(seconds: 25),
        curve: Curves.fastOutSlowIn,
      ),
    );
    return Scaffold(

      appBar: AppBar(
          title: Center(
        child: Text(
          "E-counter Nepal",
        ),




      )


      ),

      drawer: Drawer(
        child:ListView(
          children:[


            ListTile(
              leading: Icon(Icons.feedback_outlined, size:33, color:Colors.deepPurpleAccent),
              title:Text("Feedback"),
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
              },
            ),
            ListTile(
              leading: Icon(Icons.share,size:33,color:Colors.deepPurpleAccent),
              title:Text("Share"),
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
              },
            ),

            ListTile(
              leading: Icon(Icons.star,size:33,color:Colors.deepPurpleAccent),
              title:Text("Rate"),
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
              },
            ),

            ListTile(
              leading: Icon(Icons.call, size:33,color:Colors.deepPurpleAccent),
              title:Text("Call us"),
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
              },
            ),

            ListTile(
              leading: Icon(Icons.logout, size:33,color:Colors.deepPurpleAccent),
              title:Text("Log-out"),

                onTap: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  prefs.setString('login', "no");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LogInPage()));


              },
            ),

          ]


        )


      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[300].withOpacity(0.3),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.115,
                      0,
                      MediaQuery.of(context).size.width * 0.115,
                      MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.02,
                              0,
                              MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                    child: containers(
                                        FontAwesomeIcons.bus, 'Book Ticket'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChooseBooking()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: containers(
                                        FontAwesomeIcons.car, 'Reserve'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReserveList()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: containers(
                                        Icons.contact_phone_outlined,
                                        'Contact us'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ContactUs()));
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.02,
                              0,
                              MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                    child: containers(
                                        Icons.app_registration, 'Register'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: containers(
                                        Icons.car_rental, 'Rent'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RentList()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: containers(
                                        Icons.supervised_user_circle, 'Logout'),
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString('login', "no");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LogInPage()));
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.02,
                              0,
                              MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MoversList()));
                                  },
                                  child: containers(
                                      FontAwesomeIcons.truckLoading, 'Mover'),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: containers(
                                        FontAwesomeIcons.info, 'About Us'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Aboutpage()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    onTap: () {
                                      getid() async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        //Return String
                                        id = prefs.getStringList('listid');
                                        if (id == null) {
                                          Flushbar(
                                            backgroundColor: Colors.red[600],
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            flushbarStyle:
                                                FlushbarStyle.FLOATING,
                                            title: "Booking Required",
                                            message: "Ticket is not available ",
                                            duration: Duration(seconds: 2),
                                            margin: EdgeInsets.all(8),
                                            borderRadius: 8,
                                            blockBackgroundInteraction: true,
                                            dismissDirection:
                                                FlushbarDismissDirection
                                                    .VERTICAL,
                                          )..show(context);
                                          return;
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Ticket()));
                                        }
                                      }

                                      getid();
                                    },
                                    child: containers(
                                        Icons.feedback, 'My Tickets')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 1,
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: services.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.3,10,MediaQuery.of(context).size.width * 0.3,
                                  10),
                              child: Center(
                                child: Container(
                                    decoration: containerDecoration(),
                                    child: services[index]),
                              ));
                        }),
                  ),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.black54,
                        height: MediaQuery.of(context).size.height * 0.1,
                      )),
                ),
                InkWell(
                  onTap: () {
                    kPrimaryColor = colorlist[cindex];
                    if (cindex < colorlist.length - 1) {
                      cindex = cindex + 1;
                    } else {
                      cindex = 0;
                    }
                    runApp(MyApp());
                  },
                  child: Text(
                    "E-counter Nepal",
                    style: TextStyle(color: Colors.black54,fontSize:ResponsiveFlutter.of(context).fontSize(3.5)),
                  ),
                ),
                Expanded(
                  child: new Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Divider(
                        color: Colors.black54,
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        height: 20,
                      )),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 1.3, color: kPrimaryColor),
    );
  }

  Container containers(IconData icons, String text) {
    return Container(
      decoration: containerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons, color: kPrimaryColor, size: 44),
          Text(
            text,
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold,fontSize:ResponsiveFlutter.of(context).fontSize(1.8)),
          )
        ],
      ),
    );
  }
}


