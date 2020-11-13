import 'package:e_counter/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Database{

  Stream<List<UserModel>> getfirebase(String destination,String startlocation) {
    var ref = FirebaseFirestore.instance.collection('pricing').where("destination",isEqualTo: "$destination");



    return ref.snapshots().map((val) => val.docs.map((docs) => UserModel.fromFireStore(docs)).toList());


  }
}