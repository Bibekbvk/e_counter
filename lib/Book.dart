import 'package:e_counter/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
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

                SizedBox(height: 30, width: 20,),
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
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
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
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                TextField(
                  readOnly: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
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
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                RaisedButton(
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
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0),
                    child: Divider(
                      thickness:
                      MediaQuery.of(context).size.height *
                          0.001,
                      color: Colors.black54,
                      height:
                      MediaQuery.of(context).size.height *
                          0.1,
                    )),
              ),
              Text(
                "OR",
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black54),
              ),
              Expanded(
                child: new Container(
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0),
                    child: Divider(
                      color: Colors.black54,
                      thickness:
                      MediaQuery.of(context).size.height *
                          0.001,
                      height: 20,
                    )),
              ),
            ]),


                Column(
                  children: <Widget>[


                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text("Tap to Call us and book directly \n You can give missed call too."),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: InkWell(
                                onTap: (){
                                  launch('tel:9817931246');
                                },
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:
                                    AssetImage("ntc.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    launch('tel:9817931246');
                                  },
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:
                                    AssetImage("ncell.jpg"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    launch('tel:9817931246');
                                  },
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:
                                    AssetImage("smartcell.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                    FacebookButton(onPressed: (){launch('https:www.facebook.com');}),
                    Text(
                        "Email: Ecounter@gmail.com\nWebSite: WWW.Ecounter.com.np"),
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
