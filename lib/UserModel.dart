import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String full_name;
  final String contact;
  final String email;
  final String transaction_id;
  final String link;

  UserModel({this.uid, this.full_name, this.contact, this.email,this.transaction_id,this.link});

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
        uid: data['uid'],
        full_name: data['full_name'],
        email: data['email'],
        transaction_id:data['transaction_id'],
        contact: data['contact'],
    link: data['link']);
  }
}
