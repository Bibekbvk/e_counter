import 'package:cloud_firestore/cloud_firestore.dart';

class OfferValueModel {
  final String offer;




  OfferValueModel({this.offer});



  factory OfferValueModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return OfferValueModel(
        offer: data['offer'],
       )


    ;}
}