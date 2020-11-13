import 'package:e_counter/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class Book extends StatefulWidget {
  @override
  final String from;
  final String to;
  final String shift;

  const Book({Key key, this.from, this.to, this.shift}) : super(key: key);
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
  TextEditingController _dateController = TextEditingController();
  String dates;
  TextEditingController _To = TextEditingController();
  TextEditingController _Seat = TextEditingController();
  var firestoreDb = FirebaseFirestore.instance.collection("app").snapshots();
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
                Row(
                  children: [
                    Text("${widget.from}"),
                    Text("-->"),
                    Text("${widget.to}"),

                  ],
                ),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),



                TextField(
                  readOnly: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Date"
                  ),
                  onTap: (){
                    DatePicker.showPicker(context,
                        showTitleActions: true,
                        onChanged: (date) {}, onConfirm: (date) {
                          setState(() {
                            String zone;
                            if(date.hour>12){
                              zone="PM";

                            }else{
                              zone="AM";
                            }

                            dates =  "${date.year}/${date.month}/${date.day}";
                            _dateController.text=dates;
                          });
                        },

                      );
                  },
                ),


                SizedBox(
                  width: 150,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.blue.shade700,
                    child: Text("Book Ticket"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FirebaseFirestore.instance.collection("app").add({
                          "Contact": _ContactNo.text,
                          "Name": _FullName.text,
                          "timestamp": new DateTime.now(),
                          "from": widget.from,
                          "to": widget.to,
                          "by": dropdownValue,
                          "Shift": widget.shift,
                          "ticket for": dates
                        }).then((response) {
                          print(response.id);

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
