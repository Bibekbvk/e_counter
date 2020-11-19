
import 'package:e_counter/Homepage/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_image/firebase_image.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  TextEditingController _FullName = TextEditingController();
  TextEditingController _ContactNo = TextEditingController();
  TextEditingController _VechileName = TextEditingController();
  TextEditingController _ServiceLocation = TextEditingController();
  TextEditingController _SeactCapacity = TextEditingController();
  var firestoreDb = Firestore.instance.collection("app").snapshots();
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register My Vehicle")),
        body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 20,
                ),
                TextFormField(
                  controller: _FullName,
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                      val.isEmpty ? "Please enter Number" : null,
                  decoration: InputDecoration(
                      labelText: "Enter your full Name",
                      helperText: "Enter your full Name ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                TextFormField(
                  controller: _ContactNo,
                  keyboardType: TextInputType.phone,
                  validator: (val) =>
                      val.isEmpty ? "Please enter Correct Number" : null,
                  decoration: InputDecoration(
                      labelText: "Enter Contact Number",
                      helperText: "Please enter correct Contact number ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                TextFormField(
                  controller: _VechileName,
                  keyboardType: TextInputType.text,
                  validator: (val) => val.isEmpty ? "Please enter Place" : null,
                  decoration: InputDecoration(
                      labelText: "Name/ Type of Vechile",
                      helperText: "Eg:- Car/Hiace/BUS (Tata)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                TextFormField(
                  controller: _ServiceLocation,
                  validator: (val) => val.isEmpty ? "Please enter Place" : null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Service location",
                      helperText: "Eg:- kathmandu, Nepal, Jhapa",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                TextFormField(
                  controller: _SeactCapacity,
                  validator: (val) => val.isEmpty ? "Please enter Seat" : null,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Enter Seat Number",
                      helperText: "Eg: 35, 14 10",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.blue.shade700,
                    child: Text("Register My Vehicle"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Firestore.instance.collection("Register").add({
                          "Contact": _ContactNo.text,
                          "Name": _FullName.text,
                          "timestamp": new DateTime.now(),
                          "Vehicle Name": _VechileName.text,
                          "Service Location": _ServiceLocation.text
                        }).then((response) {
                          print(response.documentID);

                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Register My Vehicle"),
                              content: Text(
                                  " Success!You will receive call, for more details"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  e_counter()));
                                      _FullName.clear();
                                    },
                                    child: Text("OK")),
                              ],
                            ),
                          );
                        }).catchError((error) => print(error));
                      }
                    },
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                        "Call us directtly to Register \nYou can give miscall\nEmai: Ecounter@gmail.com\nWebSite: WWW.Ecounter.com.np"),
                    RaisedButton(
                      onPressed: () => launch('tel:9817931246'),
                      child: Text("Tap to Call us (NTC number)"),
                      color: Colors.yellowAccent,
                    ),
                    RaisedButton(
                      onPressed: () => launch('tel:9817931246'),
                      child: Text("Tap to Call us (NCELL number)"),
                      color: Colors.yellowAccent,
                    ),
                    RaisedButton(
                      onPressed: () => launch('tel:9817931246'),
                      child: Text(" Tap to Call us (Smart Cell number)"),
                      color: Colors.yellowAccent,
                    ),
                    RaisedButton(
                      onPressed: () => launch('https:www.facebook.com'),
                      child: Text("Facebook Page"),
                      color: Colors.yellowAccent,
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
