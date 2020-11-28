import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  final String ntc;
  final String ncell;
  final String smartcell;
  final String facebook;
  final String website;




  ContactModel({this.ntc,this.ncell,this.smartcell,this.facebook,this.website});



  factory ContactModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return ContactModel(
      facebook: data['facebook'],
      ncell: data['ncell'],
      ntc: data['ntc'],
      smartcell: data['smartcell'],
      website: data['website'],
    )


    ;}
}