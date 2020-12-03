import 'dart:async';
import 'package:e_counter/Contactus.dart';
import 'package:e_counter/Homepage/Movers.dart';
import 'package:e_counter/Homepage/Register.dart';
import 'package:e_counter/Homepage/TicketBooking/Choose_Booking.dart';
import 'package:e_counter/Homepage/my_tickets.dart';
import 'package:e_counter/Homepage/offers.dart';
import 'package:e_counter/Homepage/rent.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:e_counter/UserAuthentication/login.dart';
import 'package:e_counter/database.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'About.dart';
import '../Book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Reserve/choose_reserve.dart';
class e_counter extends StatefulWidget {
  @override
  _e_counterState createState() => _e_counterState();
}
class _e_counterState extends State<e_counter> {
  Database db = new Database();
  SharedPreferences prefs;
  static final String customAppThemeId = 'custom_theme';
  ScrollController _scrollController = new ScrollController();
  @override
  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', "yes");
  }
  Widget build(BuildContext context) {
    List<Widget> services;


    init();




    return StreamBuilder(
        stream:db.getContact(),
        builder: (context, contactsnapshot){
          if(contactsnapshot.hasData){
    return  StreamBuilder(
        stream:db.getoffers(),
    builder: (context, snapshot){

    if(snapshot.hasData){
        for(var i=0;i<snapshot.data.length;i++){

       if(services==null){
        services=[ InkWell(
           onTap: () {
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) =>
                         offers()));
           },
           child: Image.network(
               "${snapshot.data[i].offer}"),
         ),
      ];
       }else{
       services.add(
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          offers()));
            },
            child: Image.network(
                "${snapshot.data[i].offer}"),
          ),
        );}}

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
            automaticallyImplyLeading : false,
              title: Center(
                child: Text(
                  "E-counter Nepal",
                ),
              )),
          body: SafeArea(
            child: Container(
              color: Colors.grey[300].withOpacity(0.3),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery
                              .of(context)
                              .size
                              .width * 0.115,
                          0,
                          MediaQuery
                              .of(context)
                              .size
                              .width * 0.115,
                          MediaQuery
                              .of(context)
                              .size
                              .width * 0.04),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0,
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                  0,
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                        child: containers(
                                            FontAwesomeIcons.bus,
                                            'Book Ticket'),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChooseBooking()));
                                        }),
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02,
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
                                                      ChooseReserve()));
                                        }),
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02,
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                  0,
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02),
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
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02,
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
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                        child: containers(
                                            Icons.supervised_user_circle,
                                            'Logout'),
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                  0,
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02),
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
                                          FontAwesomeIcons.truckLoading,
                                          'Mover'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02,
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
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02,
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
                                                backgroundColor: Colors
                                                    .red[600],
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
                                              )
                                                ..show(context);
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
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.2,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 1,
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: services.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsets.fromLTRB(MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.2, 10, MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.15,
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
                      "Esewa/Khalti - ${contactsnapshot.data[0].esewa}",
                      style: TextStyle(color: kPrimaryColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(
                              1.7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
     }else{
      return Center(child: CircularProgressIndicator());

    }


        });}
        else{
          return Center(child: CircularProgressIndicator());

          }
        });}

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
