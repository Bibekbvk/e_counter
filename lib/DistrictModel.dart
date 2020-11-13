import 'package:cloud_firestore/cloud_firestore.dart';

class DistrictModel {
  final List district;


  DistrictModel({this.district});


  factory DistrictModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();
    return DistrictModel(
      district: data['district'],
     );

  }
}