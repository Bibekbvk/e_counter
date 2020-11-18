import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  final String uid;
  final String fullName;
  final String contact;
  final String email;

  AuthModel({this.uid, this.fullName, this.contact, this.email});

  factory AuthModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return AuthModel(
        uid: data['uid'],
        fullName: data['full_name'],
        email: data['email'],
        contact: data['contact']);
  }
}