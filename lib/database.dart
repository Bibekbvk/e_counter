import 'package:e_counter/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Database{

  Stream<List<UserModel>> getfirebase(String date) {
    var ref = FirebaseFirestore.instance.collection('Vechicles').where("date",isEqualTo: "$date");
    return ref.snapshots().map((val) =>
        val.docs.map((docs) => UserModel.fromFireStore(docs)).toList());


  }
}