import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'e_counter.dart';
import 'package:url_launcher/url_launcher.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  String dropdownValue = 'Hiace';
  String dayNight = 'Day';
  var time;

  @override
  TextEditingController _FullName = TextEditingController();
  TextEditingController _ContactNo = TextEditingController();
  TextEditingController _From = TextEditingController();
  TextEditingController _To = TextEditingController();
  TextEditingController _Seat = TextEditingController();
  var firestoreDb = Firestore.instance.collection("app").snapshots();
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Book Ticket")),
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
                  controller: _From,
                  keyboardType: TextInputType.text,
                  validator: (val) => val.isEmpty ? "Please enter Place" : null,
                  decoration: InputDecoration(
                      labelText: "From",
                      helperText: "Name of place you wan to travel from",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                TextFormField(
                  controller: _To,
                  validator: (val) => val.isEmpty ? "Please enter Place" : null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "To",
                      helperText: "Enter Destination",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                TextFormField(
                  controller: _Seat,
                  validator: (val) => val.isEmpty ? "Please enter Seat" : null,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Enter Seat Number",
                      helperText: "Refer....from the picture",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Select Vehicle:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(FontAwesomeIcons.arrowDown),
                      iconSize: 30,
                      elevation: 20,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w900),
                      underline: Container(
                        height: 4,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Hiace', 'Bus', 'Sumo', 'MiniBus']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Select Day/Night:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    DropdownButton<String>(
                      value: dayNight,
                      icon: Icon(FontAwesomeIcons.arrowDown),
                      iconSize: 30,
                      elevation: 20,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w900),
                      underline: Container(
                        height: 4,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dayNight = newValue;
                        });
                      },
                      items: <String>[
                        'Day',
                        'Night',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                Column(children: [
                  RaisedButton(
                    color: Colors.yellow,
                    onPressed: () {},
                    child: Text(
                      'Choose Date',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ]),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.blue.shade700,
                    child: Text("Book Ticket"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Firestore.instance.collection("app").add({
                          "Contact": _ContactNo.text,
                          "Name": _FullName.text,
                          "timestamp": new DateTime.now(),
                          "from": _From.text,
                          "to": _To.text,
                          "by": dropdownValue,
                          "Shift": dayNight,
                          "ticket for": time
                        }).then((response) {
                          print(response.documentID);

                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Book Ticket"),
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
                        "Call us directtly to Book \nYou can give miscall\nEmai: Ecounter@gmail.com\nWebSite: WWW.Ecounter.com.np"),
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
                Row(children: <Widget>[
                  Image.asset('assets/seatbus.jpg', height: 200, width: 330)
                ]),
                Row(children: <Widget>[
                  Image.asset('assets/seathi.jpg', height: 200, width: 330),
                ])
              ]),
            ),
          ),
        ));
  }
}
