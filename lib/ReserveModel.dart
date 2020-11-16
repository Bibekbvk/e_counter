import 'package:cloud_firestore/cloud_firestore.dart';

class ReserveModel {
  final String availability;
  final String chargingwifiac;
  final String driver;
  final String driverexperience;
  final String price;
  final String seatcapacity;
  final String currentlocation;
  final String type;
  final String vehicle_id;



  ReserveModel({this.availability, this.chargingwifiac, this.driver, this.driverexperience, this.price, this.seatcapacity, this.currentlocation,this.type,this.vehicle_id});



  factory ReserveModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return ReserveModel(
      availability: data['available_in'],
      chargingwifiac: data['charging/ac/wifi/tv'],
      driver: data['driver'],
      driverexperience: data['driver_experience'],
      price: data['pricing'],
      seatcapacity: data['seat_capacity'],
      currentlocation: data['vehicle_current_location'],
    type: data['type'],
    vehicle_id: data['vehicle_id']);




  }
}