import 'package:e_counter/Reuseable_codes/circle_image_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Aboutpage extends StatefulWidget {
  @override
  _AboutpageState createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("About Us"))
      ),
      body: ListView(
       children:<Widget>[

     Container(
         width: MediaQuery.of(context).size.width*01,
         child: Center(child: Image.asset('assets/ecounter.png', height: 250, width: MediaQuery.of(context).size.width*01,))),

     Center(
       child: Container(
         width: MediaQuery.of(context).size.width*01,
        padding:EdgeInsets.all(12) ,
        child: Card(
          elevation: 33,
           child: Text("E-counter App is the solution of booking ticket without visitng counter", textAlign: TextAlign.justify, style: TextStyle(fontSize: 12,
           fontStyle: FontStyle.italic),), )
       ),
     ),
     Card(
       elevation: 22,
       child:Text("Our services",textAlign: TextAlign.center, style: TextStyle(
         fontSize: 22, fontWeight: FontWeight.w800

       ),)

     ),
      ListTile(

        title: Text('Ticket Booking'),
        tileColor: Colors.deepPurple[200],
        subtitle: Text('Choose the cheapest ticket and book instantly you will get call for conformation')
      ),

         SizedBox(height: 8,),
         ListTile(

             title: Text('Vehicle Reserve'),
             tileColor: Colors.deepPurple[200],
             subtitle: Text('Choose the cheapest Vehicle and book instantly you will get call for conformation')
         ),


         SizedBox(height: 8,),
         ListTile(

             title: Text('Rent Vehicle'),
             tileColor: Colors.deepPurple[200],
             subtitle: Text('Rent the cheapest vehicle you want and go where ever you want')
         ),

         SizedBox(height: 8,),


         ListTile(

             title: Text('Movers / Shifter'),
             tileColor: Colors.deepPurple[200],
             subtitle: Text('Moving room or office? Do not worry you will get the cheapest here')
         ),

         SizedBox(height: 8,),


         ListTile(

             title: Text('Send goods'),
             tileColor: Colors.deepPurple[200],
             subtitle: Text('Send any quantity of goods from one place to another by searching and selecting the vehicle')
         ),


       ]



      ),



      
    );
  }
}