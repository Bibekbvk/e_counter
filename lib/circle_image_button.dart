import 'package:flutter/material.dart';

class CircularImageButton extends StatelessWidget {
  final String assetimage;

  const CircularImageButton(this.assetimage);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height*0.05,
      backgroundImage: AssetImage("$assetimage"),
      backgroundColor: Colors.transparent,
    );
  }
}