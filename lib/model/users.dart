import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String fullName;
  final String contact;
  final String email;

  UserModel({this.uid, this.fullName, this.contact, this.email});

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
        uid: data['uid'],
        fullName: data['full_name'],
        email: data['email'],
        contact: data['contact']);
  }
}
