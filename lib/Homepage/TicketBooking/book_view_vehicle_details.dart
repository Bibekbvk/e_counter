import 'package:e_counter/Book.dart';
import 'package:e_counter/Homepage/TicketBooking/seatBus.dart';
import 'package:e_counter/Homepage/TicketBooking/seatHiace.dart';
import 'package:e_counter/Homepage/TicketBooking/seatSumo.dart';
import 'package:e_counter/Models/book_model.dart';
import 'package:e_counter/Reuseable_codes/display_vehicle_details_card.dart';


import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  @override
  final BookModel model;


  const ViewDetails({Key key, this.model}) : super(key: key);

  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VechicleCard(upper: ["Charger","Breakfast","Lunch","Driver Experience","Offer","Pick Up","Route","Sub-Driver","Vehicle Number","TV/Music/AC","Price","Wifi","Seat","Shift"],
        lower: [widget.model.charger,widget.model.breakfast,widget.model.lunch,widget.model.driverexp,widget.model.offer,widget.model.pickuploc,widget.model.route,widget.model.subdriver,widget.model.vehiclenumber,widget.model.tvmusicac,widget.model.price,widget.model.wifi,widget.model.seat,widget.model.shift],imageurl: "${widget.model.img_url}",title: "${widget.model.vehicle_name}",btn1title: "Book",btn1onPressed: (){

        if(widget.model.type=="bus"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => seatBus(usermodel: widget.model,)));}
        else if(widget.model.type=="hiace"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => seatHiace(usermodel: widget.model,)));
        }
        else if(widget.model.type=="sumo"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => seatSumo(usermodel: widget.model,)));
        }
        else if(widget.model.type==""){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Book(usermodel: widget.model,)));
        }
        else{
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Book(usermodel: widget.model,)));
        }

        },),
    );
  }
}
