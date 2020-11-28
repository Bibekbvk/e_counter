import 'package:e_counter/database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ContactUs extends StatelessWidget {
  Database db = new Database();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:db.getContact(),
        builder: (context, snapshot){
    return

      Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Contact Us')),

          ),

        
        body: Column(
          children: [

            displayCard("Ncell",Icons.call,"${snapshot.data[0].ncell}","tel:"),
            displayCard("SmartCell", Icons.call, "${snapshot.data[0].smartcell}", "tel:"),
            displayCard("Ntc", Icons.call, "${snapshot.data[0].ntc}", "tel:"),
            displayCard("Website", Typicons.link, "${snapshot.data[0].website}",""),
            displayCard("Facebook",Typicons.social_facebook, "${snapshot.data[0].facebook}", ""),


          ],
        ),

    );
  });}
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