import 'package:cloud_firestore/cloud_firestore.dart';

class DistrictModel {
  final List district;
  final List vehicles;

  DistrictModel({this.district,this.vehicles, });


  factory DistrictModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();
    return DistrictModel(
      district: data['district'],
      vehicles: data['vehicles'],
     );

  }
}