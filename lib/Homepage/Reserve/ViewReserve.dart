import 'package:e_counter/Book.dart';
import 'package:e_counter/Homepage/Fair.dart';
import 'package:e_counter/Homepage/Reserve/reserve_price_list.dart';
import 'package:e_counter/Models/ReserveModel.dart';
import 'package:e_counter/Reuseable_codes/display_vehicle_details_card.dart';
import 'package:e_counter/database.dart';
import 'package:flutter/material.dart';

class ReserveList extends StatefulWidget {
  @override
  final String location;
  final String type;

  const ReserveList({Key key, this.location, this.type}) : super(key: key);
  _ReserveListState createState() => _ReserveListState();
}

class _ReserveListState extends State<ReserveList> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Center(child: Text("Reserve")),

      ),
      body: SingleChildScrollView(
        child: StreamBuilder(stream:db.getReserve(widget.location,widget.type) , builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              shrinkWrap: true,
                itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){



              String availability=snapshot.data[index].availability;
              String chargingwifiac=snapshot.data[index].chargingwifiac;
              String driver=snapshot.data[index].driver;
              String driverexperience=snapshot.data[index].driverexperience;
              String price=snapshot.data[index].price;
              String seatcapacity=snapshot.data[index].seatcapacity;
              String currentlocation=snapshot.data[index].currentlocation;
              String type=snapshot.data[index].type;
              String vehicle_id=snapshot.data[index].vehicle_id;
              String img_url=snapshot.data[index].image;
              List price_list=snapshot.data[index].price_list;
              ReserveModel reserveModel = ReserveModel(availability: availability,chargingwifiac: chargingwifiac,driver: driver,driverexperience: driverexperience,price: price,seatcapacity: seatcapacity,currentlocation: currentlocation,type: type,vehicle_id: vehicle_id,price_list: price_list, image: img_url);

              print("$availability +$chargingwifiac,$currentlocation,$driverexperience,$price,$seatcapacity");
              return VechicleCard(upper: ["Availability","Charging/Wifi/AC","Driver","Driver Experience","Price","Seat Capacity","Current Location","Type"],lower: ["$availability","$chargingwifiac","$driver","$driverexperience","$price","$seatcapacity","$currentlocation","$type"],btn1title: "Book",title: "Reserve",imageurl: "$img_url",btn1onPressed:(){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Book(reservemodel:reserveModel)));
              },btn2title: "Price List",btn2onPressed: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservePriceList(model:reserveModel)));
              },
              );
            });
          }
          else{
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
