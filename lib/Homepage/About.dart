import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
           child: Text("E-counter App is the solution of booking ticket without visitng  ticket counter, We assure to you that we will try our best to provide you cheapest ticket, without neglecting quality, from this app you can also reserve all types of vehicles", textAlign: TextAlign.justify, style: TextStyle(fontSize: 33,
           fontStyle: FontStyle.italic),), )
       ),
     )




       ]



      ),



      
    );
  }
}