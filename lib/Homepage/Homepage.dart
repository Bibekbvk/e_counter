import 'dart:async';
import 'package:e_counter/Contactus.dart';
import 'package:e_counter/Homepage/Movers.dart';
import 'package:e_counter/Homepage/Register.dart';
import 'package:e_counter/Homepage/Reserve/ViewReserve.dart';
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
    List<Widget> services=[ InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    offers()));
      },
      child: Image.network(
          "data:image/jpeg;base64,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"),
    ),];


    init();



    return  StreamBuilder(
        stream:db.getoffers(),
    builder: (context, snapshot){

    if(snapshot.hasData){
        for(var i=0;i<snapshot.data.length;i++){

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
        );}

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
                                                      ReserveList()));
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
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0),
                          child: Divider(
                            thickness: MediaQuery
                                .of(context)
                                .size
                                .height * 0.001,
                            color: Colors.black54,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.1,
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
                        style: TextStyle(color: Colors.black54,
                            fontSize: ResponsiveFlutter.of(context).fontSize(
                                3.5)),
                      ),
                    ),
                    Expanded(
                      child: new Container(
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Divider(
                            color: Colors.black54,
                            thickness: MediaQuery
                                .of(context)
                                .size
                                .height * 0.001,
                            height: 20,
                          )),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        );
     }else{
      return CircularProgressIndicator();

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
