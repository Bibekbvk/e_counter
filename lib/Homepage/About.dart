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
      body: Row(
       children:<Widget>[

     Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          Center(child: Image.asset('assets/ecounter.png', height: 200, width: 300,)),

          Center(
            child: Container(
             child: Card(

                child: Text("E-counter App is the solution\nof booking ticket without\nvisitng  ticket counter, We\nassure to you that we will try our best to\nprivide you cheapest ticket, without \ncompormising quality", textAlign: TextAlign.justify, style: TextStyle(fontSize: 22),), )
            ),
          )

       

         ],


     )




       ]



      ),



      
    );
  }
}