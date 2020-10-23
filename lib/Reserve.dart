import 'dart:ffi';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'e_counter.dart';

class Reserve extends StatefulWidget {
  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  TextEditingController _ContactNoSumo = TextEditingController();
  TextEditingController _ContactNoCar = TextEditingController();
  TextEditingController _ContactNoBus = TextEditingController();
  TextEditingController _ContactNoHiace = TextEditingController();
  TextEditingController _ContactNotransport = TextEditingController();
  

  var firestoreDb = Firestore.instance.collection("Reserve").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reserve Any Vehicle")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  " - You Will Receive call from our Staff, \n for More details. \n \n -Cheapest as we have 1000 of vehicle.",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/hiace.png',
                    height: 150,
                    width: 340,
                  ),
                ]),
            TextFormField(
              controller: _ContactNoHiace,
              keyboardType: TextInputType.phone,
              validator: (val) =>
                  val.isEmpty ? "Please enter Correct Number" : null,
              decoration: InputDecoration(
                  labelText: "Enter your Contact Number",
                  helperText: "Please enter correct Contact number ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Reserve Hiace"),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      if (_ContactNoHiace.text.isNotEmpty) {
                        Firestore.instance.collection("Reserve").add({
                          "Phone": _ContactNoHiace.text,
                          "Reserve": "Hiace",
                          "timestamp": new DateTime.now()
                        }).then((response) {
                          print(response.documentID);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Reserve Hiace"),
                              content: Text(
                                  " Success!You will receive call, for more details"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => e_counter()));
                                      _ContactNoHiace.clear();
                                    },
                                    child: Text("OK")),
                              ],
                            ),
                          );
                        }).catchError((error) => debugPrint(error));
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Reserve Hiace"),
                            content: Text(" Please Enter your contact number "),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Reserve()));
                                    _ContactNoHiace.clear();
                                  },
                                  child: Text("OK")),
                            ],
                          ),
                        );
                      }
                    })
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/buses.png',
                    height: 150,
                    width: 320,
                  ),
                ]),
            TextFormField(
              controller: _ContactNoBus,
              keyboardType: TextInputType.phone,
              validator: (val) =>
                  val.isEmpty ? "Please enter Correct Number" : null,
              decoration: InputDecoration(
                  labelText: "Enter your Contact Number",
                  helperText: "Please enter correct Contact number ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Reserve Bus"),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      if (_ContactNoBus.text.isNotEmpty) {
                        Firestore.instance.collection("Reserve").add({
                          "Phone": _ContactNoBus.text,
                          "Reserve": "Bus",
                          "timestamp": new DateTime.now()
                        }).then((response) {
                          print(response.documentID);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              
                              title: Text("Reserve Bus"),
                              content: Text(
                                  " Success!You will receive call, for more details"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => e_counter()));
                                      _ContactNoBus.clear();
                                    },
                                    child: Text("OK")),
                              ],
                            ),
                          );
                        }).catchError((error) => debugPrint(error));
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Reserve Bus"),
                            content: Text(" Please Enter your contact number "),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Reserve()));
                                    _ContactNoBus.clear();
                                  },
                                  child: Text("OK")),
                            ],
                          ),
                        );
                      }
                    })
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/car.png',
                    height: 150,
                    width: 320,
                  ),
                ]),
            TextFormField(
              controller: _ContactNoCar,
              keyboardType: TextInputType.text,
              validator: (val) =>
                  val.isEmpty ? "Please enter Correct Number" : null,
              decoration: InputDecoration(
                  labelText: "Enter your Contact Number",
                  helperText: "Please enter correct Contact number ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Reserve Car/Taxi"),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      if (_ContactNoCar.text.isNotEmpty) {
                        Firestore.instance.collection("Reserve").add({
                          "Phone": _ContactNoCar.text,
                          "Reserve": "Car",
                          "timestamp": new DateTime.now()
                        }).then((response) {
                          print(response.documentID);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Reserve Car"),
                              content: Text(
                                  " Success!You will receive call, for more details"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => e_counter()));
                                      _ContactNoCar.clear();
                                    },
                                    child: Text("OK")),
                              ],
                            ),
                          );
                        }).catchError((error) => debugPrint(error));
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Reserve Car"),
                            content: Text(" Please Enter your contact number "),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Reserve()));
                                    _ContactNoCar.clear();
                                  },
                                  child: Text("OK")),
                            ],
                          ),
                        );
                      }
                    })
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/sumo.png',
                    height: 150,
                    width: 320,
                  ),
                ]),                                  // this is comment
            TextFormField(
              controller: _ContactNoSumo,
              keyboardType: TextInputType.text,
              validator: (val) =>
                  val.isEmpty ? "Please enter Correct Number" : null,
              decoration: InputDecoration(
                  labelText: "Enter your Contact Number",
                  helperText: "Please enter correct Contact number ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),

                

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Reserve Sumo"),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      if (_ContactNoSumo.text.isNotEmpty) {
                        Firestore.instance.collection("Reserve").add({
                          "Phone": _ContactNoSumo.text,
                          "Reserve": "sumo",
                          "timestamp": new DateTime.now()
                        }).then((response) {
                          print(response.documentID);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Reserve Sumo"),
                              content: Text(
                                  " Success!You will receive call,for more details"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => e_counter()));
                                      _ContactNoSumo.clear();
                                    },
                                    child: Text("OK")),
                              ],
                            ),
                          );
                        }).catchError((error) => debugPrint(error));
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Reserve Sumo"),
                            content: Text(
                                " Please Enter contact number to reserve.......... "),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Reserve()));
                                    _ContactNoSumo.clear();
                                  },
                                  child: Text("OK")),
                            ],
                          ),
                        );
                      }
                    })
              ],
            ),

             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/transport.jpg',
                    height: 150,
                    width: 320,
                  ),
                ]),


 TextFormField(
              controller: _ContactNotransport,
              keyboardType: TextInputType.text,
              validator: (val) =>
                  val.isEmpty ? "Please enter Correct Number" : null,
              decoration: InputDecoration(
                  labelText: "Enter your Contact Number",
                  helperText: "Please enter correct Contact number ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),

Text("-Vehicle for transporting goods\n-Flat and Office Shifting\n-"),
Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                RaisedButton(
                    child: Text("Reserve"),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      if (_ContactNoSumo.text.isNotEmpty) {
                        Firestore.instance.collection("Reserve").add({
                          "Phone": _ContactNotransport.text,
                          "Reserve": "Transport",
                          "timestamp": new DateTime.now()
                        }).then((response) {
                          print(response.documentID);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Reserve"),
                              content: Text(
                                  " Success!You will receive call,for more details"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => e_counter()));
                                      _ContactNoSumo.clear();
                                    },
                                    child: Text("OK")),
                              ],
                            ),
                          );
                        }).catchError((error) => debugPrint(error));
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Reserve"),
                            content: Text(
                                " Please Enter contact number to reserve.......... "),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Reserve()));
                                    _ContactNoSumo.clear();
                                  },
                                  child: Text("OK")),
                            ],
                          ),
                        );
                      }
                    })
              ],
            ),


               Column(
                    children: <Widget>[
                      Text(
                          "-Call us directtly to Reserve\n-You can Reserve any Vehicle\n-You can give miscall\n-Emai: Ecounter@gmail.com\n-WebSite: www.ecounter.com.np"),
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


          ],
        ),
      ),
    );
  }
}
