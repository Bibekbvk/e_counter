import 'package:cloud_firestore/cloud_firestore.dart';

class OfferValueModel {
  final String offer;
  final String esewa;
  final String khalti;




  OfferValueModel({this.offer,this.esewa,this.khalti});



  factory OfferValueModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return OfferValueModel(
        offer: data['offer'],
      esewa: data['esewa'],
      khalti: data['khalti']
       )


    ;}
}