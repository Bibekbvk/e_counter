import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
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
  UserModel({this.destination, this.price, this.startlocation, this.type, this.shift, this.breakfast, this.driverexp, this.lunch, this.offer, this.pickuploc, this.route, this.seat, this.subdriver, this.vehiclenumber, this.charger, this.tvmusicac, this.wifi});



  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
        breakfast: data['breakFast'],
        driverexp: data['driver_experience'],
        lunch: data['launch'],
        offer: data['offer'],
        pickuploc: data['pickup_location'],
      price: data['price'],
    route:data['route'],
    seat:data['seat'],
    subdriver:data['sub_driver'],
    vehiclenumber:data['vehicle_number:'],
    charger:data['charger'],
    tvmusicac:data['tv/music/AC'],
    wifi:data['wifi'],
    destination:data['destination'],
    startlocation:data['startlocation'],
    shift: data['shift'],
    type: data['type']);


    }
}