import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String fullName;
  final String contact;
  final String email;
  final String transaction_id;

  UserModel({this.uid, this.fullName, this.contact, this.email,this.transaction_id});

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
        uid: data['uid'],
        fullName: data['full_name'],
        email: data['email'],
        transaction_id:data['transaction_id'],
        contact: data['contact']);
  }
}
