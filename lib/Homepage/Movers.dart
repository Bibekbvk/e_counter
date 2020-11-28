import 'package:e_counter/Book.dart';
import 'package:e_counter/Homepage/Fair.dart';
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
      appBar: AppBar(
        title: Center(child: Text("Movers")),
      ),
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
             List price_list=snapshot.data[index].price_list;
             String img_url=snapshot.data[index].img_url;

             MoversModel moversmodel = MoversModel(availability: availability,capacity: capacity,currentlocation: currentlocation,insurance: insurance,noofhelpers: noofhelpers,pricing: pricing,vehicleused: vehicleused,vehicle_id: vehicle_id,price_list:price_list);

            return VechicleCard(upper: ["Availability","Capacity","vehicleused","Insurance","Number of Helpers","Pricing","Vehicle Used"],lower: ["$availability","$capacity","$vehicleused","$insurance","$noofhelpers","$pricing","$vehicleused"],btn1title: "Book",title: "Movers",imageurl: "$img_url",btn1onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Book(moversmodel: moversmodel,)));
            },btn2title: "Price List",btn2onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoversList()));
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
