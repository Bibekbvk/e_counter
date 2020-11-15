import 'package:cloud_firestore/cloud_firestore.dart';

class MoversModel {
  final String availability;
  final String capacity;
  final String currentlocation;
  final String insurance;
  final String noofhelpers;
  final String pricing;
  final String vehicleused;


  MoversModel({this.availability, this.capacity, this.currentlocation, this.insurance, this.noofhelpers, this.pricing, this.vehicleused});



  factory MoversModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return MoversModel(
        availability: data['available_in'],
        capacity: data['capacity'],
        currentlocation: data['current_location'],
        insurance: data['insurance'],
        noofhelpers: data['no_of_helper'],
        pricing: data['pricing'],
        vehicleused: data['vehicle_used'],);




    }
}