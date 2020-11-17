
import 'package:e_counter/Homepage.dart';
import 'package:e_counter/ReserveModel.dart';
import 'package:e_counter/book_model.dart';
import 'package:e_counter/circle_image_button.dart';
import 'package:e_counter/movers_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<String> id;

class Book extends StatefulWidget {
  @override
 final BookModel usermodel;
  final ReserveModel reservemodel;
  final MoversModel moversmodel;

  const Book({Key key, this.usermodel, this.reservemodel, this.moversmodel, }) : super(key: key);
  _BookState createState() => _BookState();
}
DateTime time = DateTime.now();



class _BookState extends State<Book> {

  String dropdownValue = 'Hiace';
  String dayNight = 'Day';

  String zone;
  String firebasecollectionname;
  var time;
  Key key ;
  @override
  void initState() {
    time = DateTime.now();

    super.initState();
  }
  TextEditingController _FullName = TextEditingController();
  TextEditingController _ContactNo = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _serviceController = TextEditingController();
  TextEditingController _pricing = TextEditingController();


  String dates;
  String vehicle_number;
  TextEditingController _To = TextEditingController();
  TextEditingController _Seat = TextEditingController();
  var firestoreDb = FirebaseFirestore.instance.collection("app").snapshots();
  final _formKey = GlobalKey<FormState>();
  String vehicle_id;
  Widget build(BuildContext context) {
    if(widget.usermodel!=null){
      _serviceController.text="Booking Vehicle";
      _pricing.text=("${widget.usermodel.price}");
      vehicle_id=widget.usermodel.vehicle_id;
      vehicle_number=widget.usermodel.vehiclenumber;
      firebasecollectionname="User Booking";

    }
    else if(widget.reservemodel!=null){
      _serviceController.text="Reserve Vehicle";
      firebasecollectionname="User Reserve";
      vehicle_number=widget.reservemodel.vehicle_number;
      vehicle_id=widget.reservemodel.vehicle_id;

      _pricing.text=("${widget.reservemodel.price}");
    }
    else if(widget.moversmodel!=null){
      _pricing.text=("${widget.moversmodel.pricing}");
      vehicle_id=widget.moversmodel.vehicle_id;

      firebasecollectionname="User Movers";
      _serviceController.text="Movers Vehicle";
    }
    print('${vehicle_id}+vehilceee idddd');
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
                TextFormField(
                  controller: _serviceController,
                  decoration: InputDecoration(
                      labelText: "Service Selected",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                TextFormField(
                  controller: _pricing,
                  decoration: InputDecoration(
                      labelText: "Pricing",
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
                      if(id==null){
                        id=['${time.millisecond}${time.second}'];
                      }
                      else{
                        id.add('${time.millisecond}${time.second}');
                      }

                      FirebaseFirestore.instance.collection("${firebasecollectionname}").doc('${time.millisecond}${time.second}').set({
                        "contact": _ContactNo.text,
                        "full_name": _FullName.text,
                        "timestamp": new DateTime.now(),

                        "ticket_for": dates,
                        "vehicle_id": vehicle_id,
                        "vehicle_number":vehicle_number,
                        "transaction_id":'${time.millisecond}${time.second}',
                        'status':'pending',
                        'link':"https://scontent.xx.fbcdn.net/v/t1.15752-0/p280x280/125465745_3611747162218459_8121577149771972212_n.png?_nc_cat=110&ccb=2&_nc_sid=ae9488&_nc_ohc=HMallbbkjFsAX_kLAR-&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=f6d8104a464cfc8d6aee9efe4ade7938&oe=5FDAD458",

                      }).then((response) {



                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Book"),
                            content: Text(
                                " Success!You will receive call, for more details"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setStringList('listid', id);
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
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.7,

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
                          Expanded(child: Text("Tap to Call us and book directly \n You can give missed call too.")),
                          SizedBox(height: MediaQuery.of(context).size.height*0.005,),


                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                    onTap: (){
                                      launch('tel:9817931246');
                                    },
                                      child: CircularImageButton("ntc.png"),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        launch('tel:9817931246');
                                      },
                                      child: CircularImageButton("ncell.jpg"),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        launch('tel:9817931246');
                                      },
                                      child: CircularImageButton("smartcell.png"),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            launch('tel:9817931246');
                          },
                          child: CircularImageButton("facebooklogo.png"),
                        ),
                        InkWell(
                          onTap: (){
                            launch('tel:9817931246');
                          },
                          child: CircularImageButton("gmaillogo.png"),
                        ),
                      ],
                    ),

                    Text(
                        "WebSite: WWW.Ecounter.com.np"),
                  ],

                ),


              ]),
            ),
          ),
        ));
  }

}

