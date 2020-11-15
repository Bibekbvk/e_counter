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
        availability: data['Available in'],
        capacity: data['Capacity:'],
        currentlocation: data['Current location:'],
        insurance: data['Insurance'],
        noofhelpers: data['No. of helper '],
        pricing: data['Pricing '],
        vehicleused: data['Vehicle Used'],);




    }
}