
import 'dart:async';

import 'package:e_counter/Homepage/Contact.dart';
import 'package:e_counter/Homepage/Fair.dart';
import 'package:e_counter/Homepage/Movers.dart';
import 'package:e_counter/Homepage/Register.dart';
import 'package:e_counter/Homepage/Reserve/ViewReserve.dart';
import 'package:e_counter/Homepage/TicketBooking/Choose_Booking.dart';
import 'package:e_counter/Homepage/my_tickets.dart';
import 'package:e_counter/Homepage/offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'About.dart';
import '../Book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:share/share.dart';

import '../main.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
Color ticketcolor = Colors.blue[900];
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
      print("Text Okayy");


    },child: Text("Offering"),)];

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
                                            builder: (context) => ReserveList()));
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
                                    id = prefs.getStringList('listid');
                                    if(id==null){
                                      print("null");

                                    }
                                    else{


                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Ticket()));}}
                                  getid();

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: ticketcolor),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.feedback,
                                          color: ticketcolor, size: 44),
                                      Text(
                                        'My Tickets',
                                        style: TextStyle(
                                            color: ticketcolor,
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

                                  decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(20),),
                                  child: Center(child: services[index])),
                            )
                        );



                      }

                    /**children: [



                        /  SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                        Container(decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),  height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.5,child: Center(child: Text("fzs")),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                        Container(decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),   height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.5,child: Center(child: Text("R1")),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                        Container(decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)), height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.5,child: Center(child: Text("Ducati")),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                        Container(decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.5,child: Center(child: Text("Harley")),),
                        ]**/
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
    );
  }

}
