

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:e_counter/confirme.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class UserOffer extends StatefulWidget {
  final String offer;

  const UserOffer({Key key, this.offer}) : super(key: key);
  @override
  _UserOfferState createState() => _UserOfferState();
}
TextEditingController _FullName = TextEditingController();
TextEditingController _ContactNo = TextEditingController();


class _UserOfferState extends State<UserOffer> {
  @override
  void dispose() {
    _FullName.dispose();
    _ContactNo.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Selected Offer")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${widget.offer}"),
          TextFormField(
            controller: _FullName,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Please enter your name" : null,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: kPrimaryColor,),
                labelText: "Enter your full Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          TextFormField(
            controller: _ContactNo,
            keyboardType: TextInputType.phone,
            validator: (val) =>
            val.isEmpty ? "Please enter phone number" : null,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_enabled, color: kPrimaryColor,),
                labelText: "Enter Contact Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          RaisedButton(onPressed: (){

            if (_FullName.text==""){
              Flushbar(
                backgroundColor: Colors.red[600],
                flushbarPosition: FlushbarPosition.TOP,
                flushbarStyle: FlushbarStyle.FLOATING,
                title: "Name Required",
                message: "Please Enter Your Name",
                duration: Duration(seconds: 2),
                margin: EdgeInsets.all(8),
                borderRadius: 8,
                blockBackgroundInteraction: true,
                dismissDirection:
                FlushbarDismissDirection.VERTICAL,
              )..show(context);
              return;


            }
            else if(_ContactNo.text==""){
            Flushbar(
            backgroundColor: Colors.red[600],
            flushbarPosition: FlushbarPosition.TOP,
            flushbarStyle: FlushbarStyle.FLOATING,
            title: "Number Required",
            message: "Please Enter Your Phone Number",
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(8),
            borderRadius: 8,
            blockBackgroundInteraction: true,
            dismissDirection:
            FlushbarDismissDirection.VERTICAL,
            )..show(context);
            return;

            }
            else{
            FirebaseFirestore.instance.collection("Selected Offer").add({
              "offer":widget.offer,
              "Name":_FullName.text,
              "Contact":_ContactNo.text,


            }).then((response) {

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ConfirmedPurchase(title: "Confirmed Offer Booking!",text: "We will Call You As Soon As Possible",)));
            }).catchError((error) => print(error));


          }},child: Text("Book Offer"),)



        ],

      ),
    );
  }
}
