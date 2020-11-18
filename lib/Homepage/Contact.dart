import 'package:e_counter/Reuseable_codes/circle_image_button.dart';
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
      body:  Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("ntc.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("ncell.jpg"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("smartcell.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("facebooklogo.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("gmaillogo.png"),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],

      ),
    );
  }
}
