import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_counter/Book.dart';
import 'package:e_counter/ReserveModel.dart';
import 'package:e_counter/UserModel.dart';
import 'package:e_counter/book_model.dart';
import 'package:e_counter/main.dart';
import 'package:e_counter/movers_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DistrictModel.dart';


class Database{


  Stream<List<BookModel>> getfirebase(String destination,String startlocation,String vehicletype) {
    var ref = FirebaseFirestore.instance.collection('booking').where("destination",isEqualTo: "$destination").where("type",isEqualTo: "$vehicletype");
    return ref.snapshots().map((val) => val.docs.map((docs) => BookModel.fromFireStore(docs)).toList());
  }
  Stream<List<MoversModel>> getMovers() {
    var ref = FirebaseFirestore.instance.collection('Movers');
    return ref.snapshots().map((val) => val.docs.map((docs) => MoversModel.fromFireStore(docs)).toList());
  }
  Stream<List<ReserveModel>> getReserve() {
    var ref = FirebaseFirestore.instance.collection('Reserve');
    return ref.snapshots().map((val) => val.docs.map((docs) => ReserveModel.fromFireStore(docs)).toList());
  }

  Stream<List<DistrictModel>> getdistrict() {
    var ref = FirebaseFirestore.instance.collection('districts');
    var ans = ref.snapshots().map((val) => val.docs.map((docs) => DistrictModel.fromFireStore(docs)).toList());
    return ans;
  }
  Stream<List<UserModel>> getuserticketfirebase(String tickets) {
    var ref = FirebaseFirestore.instance.collection('User Booking').where('transaction_id',isEqualTo: id[int.parse(tickets)]);
    return ref.snapshots().map((val) => val.docs.map((docs) => UserModel.fromFireStore(docs)).toList());






  }
}