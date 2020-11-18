import 'package:e_counter/Book.dart';
import 'package:e_counter/Models/movers_model.dart';
import 'package:e_counter/Reuseable_codes/display_vehicle_details_card.dart';
import 'package:e_counter/database.dart';

import 'package:flutter/material.dart';

class MoversList extends StatefulWidget {
  @override
  _MoversListState createState() => _MoversListState();
}

class _MoversListState extends State<MoversList> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(stream:db.getMovers() , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){

             String availability=snapshot.data[index].availability;
             String capacity=snapshot.data[index].capacity;
             String currentlocation=snapshot.data[index].currentlocation;
             String insurance=snapshot.data[index].insurance;
             String noofhelpers=snapshot.data[index].noofhelpers;
             String pricing=snapshot.data[index].pricing;
             String vehicleused=snapshot.data[index].vehicleused;
             String vehicle_id=snapshot.data[index].vehicle_id;
             MoversModel moversmodel = MoversModel(availability: availability,capacity: capacity,currentlocation: currentlocation,insurance: insurance,noofhelpers: noofhelpers,pricing: pricing,vehicleused: vehicleused,vehicle_id: vehicle_id);

            return VechicleCard(upper: ["Availability","Capacity","vehicleused","Insurance","Number of Helpers","Pricing","Vehicle Used"],lower: ["$availability","$capacity","$vehicleused","$insurance","$noofhelpers","$pricing","$vehicleused"],btn1title: "Book",title: "Movers",imageurl: "sumo.png",btn1onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Book(moversmodel: moversmodel,)));
            },
            );
          });
        }
        else{
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
