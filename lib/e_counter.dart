import 'package:e_counter/Calculate.dart';
import 'package:e_counter/Contact.dart';
import 'package:e_counter/Register.dart';
import 'package:e_counter/Reserve.dart';
import 'package:e_counter/offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'About.dart';
import 'Book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:share/share.dart';

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
            child:
          ListView(
            children: [
              
              Image.asset('assets/logo.png'),
              
            ],
          ) ),
          // UserAccountsDrawerHeader(
          //     otherAccountsPictures: [
          //       Image.asset('assets/logo.png',
          //       width:300,
          //       height:200)
          //     ],
              
          //     accountName: Text("E-counter Nepal"),
          //     accountEmail: Text("ecounternepal@gmail.com"),
          //     currentAccountPicture: CircleAvatar(
          //     backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          //     ),),
              Card(
                elevation: 22,
                shadowColor: Colors.yellowAccent,
                              child: ListTile(
                                leading:Icon (Icons.info),
                title:Text("About"),
                onTap:(){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutpage()));
                },
                 
                ),
              ),

              Card(
                elevation: 22,
                
                shadowColor: Colors.yellowAccent,
                              child: ListTile(
                                leading:Icon (FontAwesomeIcons.star),
             title:Text("Rate us"),
                onTap:(){
                 launch('https://play.google.com/store/apps/details?id=com.f1soft.esewa&hl=en');
                },

                ),
              ),

              Card(
                elevation: 22,
                shadowColor: Colors.yellowAccent,
                              child: ListTile(
                            leading:Icon (Icons.share),
             title:Text("Share"),
                onTap:(){
                  Share.share("Please Download our app, https://play.google.com/store/apps/details?id=com.f1soft.esewa&hl=en ");
                  // Navigator.of(context).pop();

                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutpage()));
                },

                ),
              ),
  
    ]),
        
      ),
      body: ListView(children: <Widget>[
        
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.ticketAlt,
                  ),
                  iconSize: 140,
                  
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Book()),
                  );
                   
                  },),
           
                  
           
           
           
              SizedBox(width: 12),
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.bus
                  ),
                  iconSize: 140,
                 onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Reserve()),
                  );

                  },),
            ],
          ),
        ),
             

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
               Text("Book Ticket" ,style:TextStyle(
                 fontSize:18,
                 fontWeight:FontWeight.w800
               ),),
               Text("Reserve Vehicle",
               style:TextStyle(
                 fontSize:18,
                 fontWeight:FontWeight.w800
               ),)


           ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.call,
                    ),
                    iconSize: 140,
                     onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact()),
                  );

                  },),
                SizedBox(width: 12),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.registered,
                    ),
                    iconSize: 140,
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()),
                  );

                  },),
              ],
            ),
          ),
        ),


         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
               Text("Contact Directy",style:TextStyle(
                 fontSize:20,
                 fontWeight:FontWeight.w800
               ),),
               Text("Register",
               style:TextStyle(
                 fontSize:20,
                 fontWeight:FontWeight.w800
               ),)


           ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.moneyBillWave
                ),
                iconSize: 140,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Calculate()),
                  );

                  },),
            SizedBox(width: 12),
            IconButton(
                icon: Icon(
                  Icons.local_offer,
                ),
                iconSize: 140,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> offers()),
                  );

                  },),
          ],
        ),
 Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
               Text("View Fair",
               style:TextStyle(
                 fontSize:20,
                 fontWeight:FontWeight.w800
               ),),
               Text("Offers",
               style:TextStyle(
                 fontSize:20,
                 fontWeight:FontWeight.w800
               ),)


           ],
        ),
        
      ]),
      backgroundColor: Colors.amberAccent,
    );
  }
}
