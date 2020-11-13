import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String destination;
  final String price;
  final String startlocation;
  final String type;
  final String shift;

  UserModel({this.destination, this.price, this.startlocation,this.type,this.shift});


  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
        destination: data['destination'],
        price: data['price'],
        startlocation: data['startlocation'],
        type: data['type'],
        shift: data['shift'],);


    }
}