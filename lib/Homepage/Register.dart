
import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/Reuseable_codes/circle_image_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Color color_ = Colors.deepPurple.withOpacity(0.8);
  var firestoreDb = Firestore.instance.collection("app").snapshots();
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Register My Vehicle"))),
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
                      prefixIcon: Icon(Icons.person, color: color_,),
                      labelText: "Enter your full Name",
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                TextFormField(
                  controller: _ContactNo,
                  keyboardType: TextInputType.phone,
                  validator: (val) =>
                      val.isEmpty ? "Please enter Correct Number" : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_enabled, color: color_,),
                      labelText: "Enter Contact Number",
                      hintText: "9868187674",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                TextFormField(
                  controller: _VechileName,
                  keyboardType: TextInputType.text,
                  validator: (val) => val.isEmpty ? "Please enter Place" : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.bus_alert, color: color_,),
                    hintText: "Deluxe, Kankrebihar",
                      labelText: "Name/ Type of Vechile",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                TextFormField(
                  controller: _ServiceLocation,
                  validator: (val) => val.isEmpty ? "Please enter Place" : null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Service location",
                      prefixIcon: Icon(Icons.design_services, color: color_,),
                      hintText: "Eg:- kathmandu, Nepal, Jhapa",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                TextFormField(
                  controller: _SeactCapacity,
                  validator: (val) => val.isEmpty ? "Please enter Seat" : null,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.airline_seat_recline_normal_sharp, color: color_,),
                      labelText: "Enter Seat Number",
                      hintText: "Eg: 35, 14 10",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),



                   RaisedButton(
                    color: Colors.deepPurpleAccent,
                    child: Text("Register My Vehicle", style: TextStyle(color: Colors.white),),
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
                              title: Text("Register My Vehicle", style: TextStyle(color: Colors.white),),
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
                SizedBox(height: MediaQuery.of(context).size.height*0.005,),

                Container(
                  height:  MediaQuery.of(context).size.height*0.09,
                  child: Text
                  ("Call us directly to Register.\nYou can give missed call too",style: GoogleFonts.laila(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),),),

                SizedBox(height: MediaQuery.of(context).size.height*0.005,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("ntc.png"),
                    ),
                    InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("ncell.jpg"),
                    ),
                    InkWell(
                      onTap: (){
                        launch('tel:9817931246');
                      },
                      child: CircularImageButton("smartcell.png"),
                    ),




                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
