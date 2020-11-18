import 'package:e_counter/book_model.dart';
import 'package:e_counter/book_view_vehicle_details.dart';
import 'package:e_counter/database.dart';
import 'package:flutter/material.dart';

import 'display_vehicle_details_card.dart';

class ShowVehicles extends StatefulWidget {
  @override

  final String destination;
  final String startlocation;
  final String vehicletype;
  final String departure_date;
  const ShowVehicles({Key key, this.destination, this.startlocation, this.vehicletype, this.departure_date}) : super(key: key);
  _ShowVehiclesState createState() => _ShowVehiclesState();
}

class _ShowVehiclesState extends State<ShowVehicles> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    double heightquery = MediaQuery.of(context).size.height;
    double widthquery = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("${widget.startlocation} -  ${widget.destination}")),),
      body: StreamBuilder(stream:db.getfirebase("${widget.destination}","${widget.startlocation}","${widget.vehicletype}","${widget.departure_date}") , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){
             String destination = snapshot.data[index].destination;
             String price= snapshot.data[index].price;
             String startlocation= snapshot.data[index].startlocation;
             String type= snapshot.data[index].type;
             String shift= snapshot.data[index].shift;
            String breakfast= snapshot.data[index].breakfast;
             String driverexp= snapshot.data[index].driverexp;
             String lunch= snapshot.data[index].lunch;
             String offer= snapshot.data[index].offer;
             String pickuploc= snapshot.data[index].pickuploc;
             String route= snapshot.data[index].route;
             String seat= snapshot.data[index].seat;
             String subdriver= snapshot.data[index].subdriver;
             String vehiclenumber= snapshot.data[index].vehiclenumber;
             String charger= snapshot.data[index].charger;
             String tvmusicac= snapshot.data[index].tvmusicac;
             String wifi= snapshot.data[index].wifi;
             String vehicle_id= snapshot.data[index].vehicle_id;
             String vehicle_name=snapshot.data[index].vehicle_name;
             String img_url = snapshot.data[index].img_url;
             BookModel booking = BookModel(destination: destination,startlocation: startlocation,type: type,breakfast: breakfast,driverexp: driverexp,lunch: lunch,
                 offer: offer,pickuploc: pickuploc,route: route,subdriver: subdriver,vehiclenumber: vehiclenumber,charger: charger,tvmusicac: tvmusicac,price: price,wifi: wifi,shift: shift,seat: seat,vehicle_id:vehicle_id,vehicle_name: vehicle_name,img_url: img_url);
            return VechicleCard(upper: ["Price","Wifi","Shift","Seat"],lower: ["$price","$wifi","$shift","$seat"],btn1title: "View",title: "${vehicle_name}",imageurl: "${img_url}",
            btn1onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewDetails(model: booking,)));
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
