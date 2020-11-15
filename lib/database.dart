import 'file:///E:/AndroidStudioProjects/e_counter/lib/Models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_counter/Models/movers_model.dart';

import 'Models/DistrictModel.dart';


class Database{

  Stream<List<UserModel>> getfirebase(String destination,String startlocation,String vehicletype) {
    var ref = FirebaseFirestore.instance.collection('booking').where("destination",isEqualTo: "$destination").where("type",isEqualTo: "$vehicletype");
    return ref.snapshots().map((val) => val.docs.map((docs) => UserModel.fromFireStore(docs)).toList());
  }
  Stream<List<MoversModel>> getMovers() {
    var ref = FirebaseFirestore.instance.collection('movers');
    return ref.snapshots().map((val) => val.docs.map((docs) => MoversModel.fromFireStore(docs)).toList());
  }

  Stream<List<DistrictModel>> getdistrict() {
    var ref = FirebaseFirestore.instance.collection('districts');
    var ans = ref.snapshots().map((val) => val.docs.map((docs) => DistrictModel.fromFireStore(docs)).toList());
    return ans;
  }
}