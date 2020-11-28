import 'package:e_counter/Reuseable_codes/circle_image_button.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
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


     Padding(
       padding: EdgeInsets.fromLTRB(10,0,10,0),
       child: Container(
         decoration: BoxDecoration(
           border: Border.all(color: kPrimaryColor),
           borderRadius: BorderRadius.circular(20),
         ),
         child: Column(
           children: [
             Container(
               child:Text("Our services",textAlign: TextAlign.center, style: TextStyle(
                 fontSize: ResponsiveFlutter.of(context).fontSize(1.7), fontWeight: FontWeight.w800

               ),)

             ),
             listitle('Ticket Booking', 'Choose the cheapest ticket and book instantly you will get call for confirmation'),
             SizedBox(height: 8,),
             listitle('Vehicle Reserve', 'Choose the cheapest Vehicle and book instantly you will get call for confirmation'),
             SizedBox(height: 8,),
             listitle('Rent Vehicle', 'Rent the cheapest vehicle you want and go where ever you want'),
             SizedBox(height: 8,),
             listitle('Movers / Shifter', 'Moving room or office? Do not worry you will get the cheapest here'),
             SizedBox(height: 8,),
             listitle('Send goods', 'Send any quantity of goods from one place to another by searching and selecting the vehicle')
           ],
         ),
       ),
     ),

       ]
      ),
    );
  }
  Widget listitle(String title,String description){
    return  Container(

      child: ListTile(
          title: Text('$title'),
          subtitle: Text('$description')
      ),
    );
  }
}