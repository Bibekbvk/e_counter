import 'package:e_counter/database.dart';
import 'package:e_counter/display_vehicle_details_card.dart';
import 'package:flutter/material.dart';

class ReserveList extends StatefulWidget {
  @override
  _ReserveListState createState() => _ReserveListState();
}

class _ReserveListState extends State<ReserveList> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(stream:db.getReserve() , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){


            String availability=snapshot.data[index].availability;
            String chargingwifiac=snapshot.data[index].chargingwifiac;
            String driver=snapshot.data[index].driver;
            String driverexperience=snapshot.data[index].driverexperience;
            String price=snapshot.data[index].price;
            String seatcapacity=snapshot.data[index].seatcapacity;
            String currentlocation=snapshot.data[index].currentlocation;
            String type=snapshot.data[index].type;

            print("$availability +$chargingwifiac,$currentlocation,$driverexperience,$price,$seatcapacity");
            return VechicleCard(upper: ["Availability","Charging/Wifi/AC","Driver","Driver Experience","Price","Seat Capacity","Current Location","Type"],lower: ["$availability","$chargingwifiac","$driver","$driverexperience","$price","$seatcapacity","$currentlocation","$type"],btn1title: "Book",title: "Reserve",assetimage: "car.png",
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