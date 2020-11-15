import 'package:e_counter/Reuseable_codes/display_vehicle_details_card.dart';
import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  @override
  final String destination;
  final String price;
  final String startlocation;
  final String type;
  final String shift;
  final String breakfast;
  final String driverexp;
  final String lunch;
  final String offer;
  final String pickuploc;
  final String route;
  final String seat;
  final String subdriver;
  final String vehiclenumber;
  final String charger;
  final String tvmusicac;
  final String wifi;


  const ViewDetails({Key key, this.destination, this.startlocation, this.type, this.charger, this.breakfast, this.driverexp, this.lunch, this.offer, this.pickuploc, this.route, this.subdriver, this.vehiclenumber, this.tvmusicac, this.price, this.shift, this.seat, this.wifi}) : super(key: key);

  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VechicleCard(upper: ["Charger","Breakfast","Lunch","Driver Experience","Offer","Pick Up","Route","Sub-Driver","Vehicle Number","TV/Music/AC","Price","Wifi","Seat","Shift"],
        lower: [widget.charger,widget.breakfast,widget.lunch,widget.driverexp,widget.offer,widget.pickuploc,widget.route,widget.subdriver,widget.vehiclenumber,widget.tvmusicac,widget.price,widget.wifi,widget.seat,widget.shift],assetimage: "buses.png",title: "bus",btn1title: "Book",),
    );
  }
}
