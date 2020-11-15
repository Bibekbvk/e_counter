import 'package:e_counter/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'DistrictModel.dart';


class Database{

  Stream<List<UserModel>> getfirebase(String destination,String startlocation,String vehicletype) {
    var ref = FirebaseFirestore.instance.collection('pricing').where("destination",isEqualTo: "$destination").where("type",isEqualTo: "$vehicletype");
    return ref.snapshots().map((val) => val.docs.map((docs) => UserModel.fromFireStore(docs)).toList());
  }
  Stream<List<DistrictModel>> getdistrict() {
    var ref = FirebaseFirestore.instance.collection('districts');
    var ans = ref.snapshots().map((val) => val.docs.map((docs) => DistrictModel.fromFireStore(docs)).toList());
    return ans;
  }
}