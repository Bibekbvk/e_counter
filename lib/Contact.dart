import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact us directly....")),
      body: ListView(
        children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 
                    Image.asset('assets/ecounter.png', height: 180, width: 350,)
                  
                ]
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

              Text("Ecounter Nepal \n Contact us Directly \n You can Book ticket in a call \n  ")


          ],
              

             ),
           ),


            Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

              Text(" 9817931246 \n  9817931246 \n  9817931246 \n Emai: Ecounter@gmail.com \n WebSite: WWW.Ecounter.com.np"),
              
              RaisedButton(
                onPressed: 
              ()=> launch('tel:9817931246'),
              child: Text("Tap to Call us (NTC number)"),
              color: Colors.yellowAccent,
              
              ),


              RaisedButton(
                onPressed: 
              ()=> launch('tel:9817931246'),
              child: Text("Tap to Call us (NCELL number)"),
              color: Colors.yellowAccent,
              
              ), 
               RaisedButton(
                onPressed: 
              ()=> launch('tel:9817931246'),
              child: Text(" Tap to Call us (Smart Cell number)"),
               color: Colors.yellowAccent,
              ),                      

                RaisedButton(
                      onPressed: () => launch('https:www.facebook.com'),
                      child: Text("Facebook Page"),
                      color: Colors.yellowAccent,
                    ),
                

          ],
              

             ),
           ),

              


        ],
      ),
    );
  }
}
