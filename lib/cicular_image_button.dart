import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularImageButton {
  final String imageurl;
  final BuildContext context;
  CircularImageButton(this.imageurl, this.context);

  Widget circularbutton(){
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height*0.05,
      backgroundImage:
      AssetImage("$imageurl"),
      backgroundColor: Colors.transparent,
    );

  }



}