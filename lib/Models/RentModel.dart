import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RentModel {
  final String availability;
  final String capacity;
  final String currentlocation;
  final String insurance;
  final String rentedby;
  final String pricing;
  final String vehicle_no;
  final String vehicle_id;
  final List price_list;
  final String vehicle_name;
  final String description;

  RentModel({this.availability, this.capacity, this.currentlocation, this.insurance, this.rentedby, this.pricing, this.vehicle_no,this.vehicle_id,this.price_list, this.vehicle_name, this.description});



  factory RentModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return RentModel(
      availability: data['available_in'],
      capacity: data['capacity'],
      currentlocation: data['current_location'],
      insurance: data['insurance'],
      rentedby: data['rentedby'],
      pricing: data['pricing'],
        vehicle_no: data['vehicle_no'],
      vehicle_id:data['vehicle_id'],
      price_list: data['price_list'],
      vehicle_name: data['vehiclename'],
      description: data['description']
       );}
}