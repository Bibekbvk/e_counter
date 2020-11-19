import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Contact Us')),

          ),

        
        body: Column(
          children: [

            displayCard("Ncell",Icons.call,"9860120715","tel:"),
            displayCard("SmartCell", Icons.call, "9860120715", "tel:"),
            displayCard("Ntc", Icons.call, "9860120715", "tel:"),
            displayCard("Website", Typicons.link, "www.fb.com", ""),
            displayCard("Facebook",Typicons.social_facebook, "facebook.com", ""),


          ],
        ),

    );
  }
  Widget displayCard(String name,IconData icon,String id,String type){
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          '$name',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: () {
          launch('$type' + id);
        },
      ),
    );
  }
}