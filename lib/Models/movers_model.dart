import 'package:cloud_firestore/cloud_firestore.dart';

class MoversModel {
  final String availability;
  final String capacity;
  final String currentlocation;
  final String insurance;
  final String noofhelpers;
  final String pricing;

  final String vehicleused;
  final String vehicle_id;
  final List price_list;
  final String img_url;

  MoversModel({this.availability, this.capacity, this.currentlocation, this.insurance, this.noofhelpers, this.pricing, this.vehicleused,this.vehicle_id,this.price_list,this.img_url});



  factory MoversModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return MoversModel(
        availability: data['available_in'],
        capacity: data['capacity'],
        currentlocation: data['current_location'],
        insurance: data['insurance'],
        noofhelpers: data['no_of_helper'],
        pricing: data['pricing'],
        vehicleused: data['vehicle_used'],
    vehicle_id:data['vehicle_id'],
      price_list: data['price_list'],
      img_url: data['img_url'],



    );




    }
}