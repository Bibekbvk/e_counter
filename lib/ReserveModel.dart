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



  ReserveModel({this.availability, this.chargingwifiac, this.driver, this.driverexperience, this.price, this.seatcapacity, this.currentlocation,this.type});



  factory ReserveModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return ReserveModel(
      availability: data['Available in'],
      chargingwifiac: data['Charging/wifi/AC'],
      driver: data['Driver '],
      driverexperience: data['Driver Experience '],
      price: data['Pricing '],
      seatcapacity: data['Seat Capacity'],
      currentlocation: data['Vahicle Current Location'],
    type: data['type']);




  }
}