import 'package:e_counter/Book.dart';
import 'package:e_counter/Homepage/Fair.dart';
import 'package:e_counter/Models/RentModel.dart';
import 'package:e_counter/Models/movers_model.dart';
import 'package:e_counter/Reuseable_codes/display_vehicle_details_card.dart';
import 'package:e_counter/database.dart';

import 'package:flutter/material.dart';

class RentList extends StatefulWidget {
  @override
  _RentListState createState() => _RentListState();
}

class _RentListState extends State<RentList> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Rent")),
      ),
      body: StreamBuilder(stream:db.getrental() , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){

            String availability=snapshot.data[index].availability;
            String capacity=snapshot.data[index].capacity;
            String currentlocation=snapshot.data[index].currentlocation;
            String insurance=snapshot.data[index].insurance;
            String rentedby=snapshot.data[index].rentedby;
            String pricing=snapshot.data[index].pricing;
            String vehicle_no=snapshot.data[index].vehicle_no;
            String vehicle_id=snapshot.data[index].vehicle_id;
            List price_list=snapshot.data[index].price_list;
            String vehicle_name= snapshot.data[index].vehicle_name;
            String description= snapshot.data[index].description;


            RentModel rentmodel = RentModel(availability: availability,capacity: capacity,currentlocation: currentlocation,insurance: insurance,rentedby: rentedby,pricing: pricing,vehicle_no: vehicle_no,vehicle_id: vehicle_id,price_list:price_list, vehicle_name: vehicle_name, description: description);

            return VechicleCard(upper: ["Availability","Capacity","vehicle used","Insurance","rented by","Pricing","Vehicle no","description"],lower: ["$availability","$capacity","$vehicle_name","$insurance","$rentedby","$pricing","$vehicle_no","$description"],btn1title: "Book",title: "${vehicle_name})",imageurl: "sumo.png",btn1onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Book(rentmodel: rentmodel,)));
            },btn2title: "Price List",btn2onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RentList()));
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
