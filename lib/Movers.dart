import 'package:e_counter/database.dart';
import 'package:e_counter/display_vehicle_details_card.dart';
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

            return VechicleCard(upper: ["Availability","Capacity","vehicleused","Insurance","Number of Helpers","Pricing","Vehicle Used"],lower: ["$availability","$capacity","$vehicleused","$insurance","$noofhelpers","$pricing","$vehicleused"],btn1title: "Book",title: "Movers",assetimage: "sumo.png",
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
