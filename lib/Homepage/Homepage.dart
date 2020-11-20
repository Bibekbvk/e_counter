import 'dart:async';
import 'package:e_counter/Contactus.dart';
import 'package:e_counter/Homepage/Contact.dart';
import 'package:e_counter/Homepage/Fair.dart';
import 'package:e_counter/Homepage/Movers.dart';
import 'package:e_counter/Homepage/Register.dart';
import 'package:e_counter/Homepage/Reserve/ViewReserve.dart';
import 'package:e_counter/Homepage/TicketBooking/Choose_Booking.dart';
import 'package:e_counter/Homepage/my_tickets.dart';
import 'package:e_counter/Homepage/offers.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'About.dart';
import '../Book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:share/share.dart';


import '../main.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
Color ticketcolor =AppColor;
class e_counter extends StatefulWidget {
  @override
  _e_counterState createState() => _e_counterState();
}

class _e_counterState extends State<e_counter> {


  ScrollController _scrollController = new ScrollController();

  final FirebaseMessaging _messaging = FirebaseMessaging();
  @override
  List<Widget> services= [Text("Offer1", style: TextStyle(color: Colors.black),) ,Text("offers"),
    FlatButton(onPressed: (){
      print("Text Okayy");},child: Text("Offering"),)   ];

  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
          () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(seconds:25),
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
                                    child: containers(FontAwesomeIcons.bus,'Book Ticket'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChooseBooking()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: containers(FontAwesomeIcons.car,'Reserve'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ReserveList()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child:containers(Icons.contact_phone_outlined,'Contact us'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ContactUs()));
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
                                    child:containers(Icons.app_registration,'Register'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Register()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child:containers(Icons.money_off_outlined,'Faire'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Calculate()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child:containers(Icons.celebration,'Offer'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => offers()));
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
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MoversList()));
                                  },
                                  child:containers(FontAwesomeIcons.truckLoading,'Mover'),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: containers(FontAwesomeIcons.info,'About Us'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Aboutpage()));
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    getid() async{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      //Return String
                                      id = prefs.getStringList('listid');

                                      if(id == null){




                                          Flushbar(
                                            backgroundColor: Colors.red[600],
                                            flushbarPosition: FlushbarPosition.TOP,
                                            flushbarStyle: FlushbarStyle.FLOATING,
                                            title: "Booking Required",
                                            message: "Ticket is not available ",
                                            duration: Duration(seconds: 2),
                                            margin: EdgeInsets.all(8),
                                            borderRadius: 8,
                                            blockBackgroundInteraction: true,
                                            dismissDirection:
                                            FlushbarDismissDirection.VERTICAL,
                                          )..show(context);
                                          return;

                                        }

                                      else{


                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Ticket()));}}
                                    getid();

                                  },
                                  child:
                                  containers(Icons.feedback,'My Tickets')

                                ),
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
                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*1,
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: services.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          print(index);
                          return Padding(
                              padding:  EdgeInsets.fromLTRB(50, 10, 50, 10),

                              child: Center(
                                child: Container(

                                    height: MediaQuery.of(context).size.height*0.2,
                                    width: MediaQuery.of(context).size.width*0.5,

                                    decoration: containerDecoration(),
                                    child: Center(child: services[index])),
                              )
                          );



                        }

                    ),
                  ),
                ),
              ),
              Row(children: <Widget>[
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
                Text(
                  "E-counter Nepal",
                  style: TextStyle(
                      fontSize: 20,

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


            ],
          ),
        ),
      ),
    );
  }
  BoxDecoration containerDecoration(){
    return BoxDecoration(color: Colors.white,

      borderRadius: BorderRadius.circular(5),
      border:
      Border.all(width: 1.3,color: Colors.purple[900]),

    );
  }
  Container containers(IconData icons,String text){
    return Container(
      decoration: containerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons,
              color: ticketcolor, size: 44),
          Text(
            text,
            style: TextStyle(
                color: ticketcolor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );


  }

}
