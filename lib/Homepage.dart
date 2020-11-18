import 'package:e_counter/Calculate.dart';
import 'package:e_counter/Choose_Booking.dart';
import 'package:e_counter/Contact.dart';
import 'package:e_counter/Movers.dart';
import 'package:e_counter/Register.dart';
import 'package:e_counter/Reserve.dart';
import 'package:e_counter/ViewReserve.dart';
import 'package:e_counter/choose_reserve.dart';
import 'package:e_counter/circle_image_button.dart';
import 'package:e_counter/my_tickets.dart';
import 'package:e_counter/offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'About.dart';
import 'Book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:share/share.dart';

import 'main.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
class e_counter extends StatefulWidget {
  @override
  _e_counterState createState() => _e_counterState();
}

class _e_counterState extends State<e_counter> {
  final FirebaseMessaging _messaging = FirebaseMessaging();
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "E-counter Nepal",
      )),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.all(1),
              child: ListView(
                children: [
                  Image.asset('assets/logo.png'),
                ],
              )),

          Card(
            elevation: 22,
            shadowColor: Colors.yellowAccent,
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aboutpage()));
              },
            ),
          ),

          Card(
            elevation: 22,
            shadowColor: Colors.yellowAccent,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.star),
              title: Text("Rate us"),
              onTap: () {
                launch(
                    'https://play.google.com/store/apps/details?id=com.f1soft.esewa&hl=en');
              },
            ),
          ),

          Card(
            elevation: 22,
            shadowColor: Colors.yellowAccent,
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: () {
                Share.share(
                    "Please Download our app, https://play.google.com/store/apps/details?id=com.f1soft.esewa&hl=en ");
                // Navigator.of(context).pop();

                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutpage()));
              },
            ),
          ),
        ]),
      ),
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              flex: 5,
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.bus,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Book Ticket',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.car,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Reserve',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChooseReserve()));
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.lightBlue),
                                ),
                                child: InkWell(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.contact_phone_outlined,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Contact us',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Contact()));
                                    }),
                              ),
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.app_registration,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Register',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.money_off_outlined,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Faire',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.celebration,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Offer',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.lightBlue),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(FontAwesomeIcons.truckLoading,
                                          color: Colors.blue[900], size: 44),
                                      Text(
                                        'Mover',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.info,
                                            color: Colors.blue[900], size: 44),
                                        SizedBox(height: 20),
                                        Text(
                                          'About Us',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Aboutpage()));
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  getid() async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  //Return String
                                   id = prefs.getStringList('listid');}
                                  getid();
                                  if(id==null){

                                  }
                                  else{


                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Ticket()));}
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.lightBlue),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.feedback,
                                          color: Colors.blue[900], size: 44),
                                      Text(
                                        'My Tickets',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
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
    );
  }

}
