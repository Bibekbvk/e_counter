import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String date;
  final String destination;
  final String price;
  final String startlocation;
  final String time;
  final String type;
  UserModel({this.date, this.destination, this.price, this.startlocation, this.time, this.type});


  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
        date: data['date'],
        destination: data['destination'],
        price: data['price'],
        startlocation: data['startlocation'],
        time: data['time'],
        type: data['type'],);



    }
}