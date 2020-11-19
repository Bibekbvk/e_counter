import 'package:dropdown_search/dropdown_search.dart';
import 'package:e_counter/Homepage/TicketBooking/showvehicles.dart';
import 'package:e_counter/database.dart';
import 'package:flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChooseBooking extends StatefulWidget {
  @override
  _ChooseBookingState createState() => _ChooseBookingState();
}

class _ChooseBookingState extends State<ChooseBooking> {

  @override
  List<String> district;
  List<String> vehicletype;
  String selected;
  String dates="";
  String selecteddistrictdes="";
  String selectedvehicletype="";
  String selectedday="";

  String selecteddistrict="";
  List<String> hints ;
  double frombutton=0;
  double destinationbutton=0;
  Database db = Database();
  String selectedtime="";
  String hint="";
  TextEditingController _departure_dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> _day = ["Day", "Night"];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Book Ticket")),
      ),

      body: StreamBuilder(
          stream:db.getdistrict(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              for(var each in snapshot.data[0].district){
                if(district!=null){
                  district.add(each.toString());}
                else{
                  district=[each.toString()];
                }
              }
              for(var each in snapshot.data[0].vehicles){
                if(vehicletype!=null){
                  vehicletype.add(each.toString());}
                else{
                  vehicletype=[each.toString()];
                }
              }


              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("From"),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20,0,20,0),
                                child: DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showSelectedItem: true,
                                    items:  district,
                                    validator: (val) =>
                                    val.isEmpty ? "Please  select the Vehicletype " : null,



                                    onChanged: (val){
                                      selecteddistrict = val;

                                    },

                                    selectedItem: selecteddistrict),
                              ),],),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("To"),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20,0,20,0),
                                child: DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showSelectedItem: true,
                                    items:district,
                                    validator: (val) =>
                                    val.isEmpty ? "Please  select the Vehicletype " : null,

                                    onChanged: (val){
                                      selecteddistrictdes = val;
                                    },
                                    selectedItem: selecteddistrictdes),
                              ),
                            ],)
                          ,
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(20,10,20,10),
                      child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          label: "Vehicle Type",
                          validator: (val) =>
                          val.isEmpty ? "Please  select the Vehicletype " : null,
                          showSelectedItem: true,
                          items:vehicletype,
                          onChanged: (val){
                            selectedvehicletype = val;
                          },
                          selectedItem: selectedvehicletype),
                    ),  Padding(
                      padding: EdgeInsets.fromLTRB(20,10,20,10),
                      child: TextFormField(
                        onTap: (){

                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              onChanged: (date) {}, onConfirm: (date) {

                                String dates =  "${date.year}/${date.month}/${date.day}";
                                _departure_dateController.text=dates
                                ;
                              });
                        },
                        controller: _departure_dateController,
                        keyboardType: TextInputType.text,
                        validator: (value) => value.isEmpty ? 'Date is required' : null,
                        decoration: InputDecoration(
                            labelText: "Departure Date",
                            border: OutlineInputBorder(

                            ),
                        ),
                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,0,20,0),
                      child: DropdownSearch<String>(
                        label: "Shift",
                          mode: Mode.MENU,
                          showSelectedItem: true,
                          items: _day,

                          validator: (val) =>
                          val.isEmpty ? "Please  select the Time " : null,

                          onChanged: (val){
                            selectedday = val;
                          },
                          selectedItem: selectedday),
                    ),
                    RaisedButton(


                      onPressed: (){



                          if  (selectedvehicletype=="") {


                            Flushbar(
                              backgroundColor: Colors.red[600],
                              flushbarPosition: FlushbarPosition.TOP,
                              flushbarStyle: FlushbarStyle.FLOATING,
                              title: "VehicleType Required",
                              message: "Please select VehicleType",
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(8),
                              borderRadius: 8,
                              blockBackgroundInteraction: true,
                              dismissDirection:
                              FlushbarDismissDirection.VERTICAL,
                            )..show(context);
                            return;

                          }
                          else if (selectedday==""){
                            Flushbar(
                              backgroundColor: Colors.red[600],
                              flushbarPosition: FlushbarPosition.TOP,
                              flushbarStyle: FlushbarStyle.FLOATING,
                              title: "Dayuuuu Required",
                              message: "Please select your date",
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(8),
                              borderRadius: 8,
                              blockBackgroundInteraction: true,
                              dismissDirection:
                              FlushbarDismissDirection.VERTICAL,
                            )..show(context);
                            return;


                          }
                          else if (_day==""){
                            Flushbar(
                              backgroundColor: Colors.red[600],
                              flushbarPosition: FlushbarPosition.TOP,
                              flushbarStyle: FlushbarStyle.FLOATING,
                              title: "Shift Required",
                              message: "Please select your shift",
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(8),
                              borderRadius: 8,
                              blockBackgroundInteraction: true,
                              dismissDirection:
                              FlushbarDismissDirection.VERTICAL,
                            )..show(context);
                            return;


                          }

                          else if (selecteddistrict==""){
                            Flushbar(
                              backgroundColor: Colors.red[600],
                              flushbarPosition: FlushbarPosition.TOP,
                              flushbarStyle: FlushbarStyle.FLOATING,
                              title: "District Required",
                              message: "Please enter your location",
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(8),
                              borderRadius: 8,
                              blockBackgroundInteraction: true,
                              dismissDirection:
                              FlushbarDismissDirection.VERTICAL,
                            )..show(context);
                            return;


                          }
                          else if (selecteddistrictdes==""){
                            Flushbar(
                              backgroundColor: Colors.red[600],
                              flushbarPosition: FlushbarPosition.TOP,
                              flushbarStyle: FlushbarStyle.FLOATING,
                              title: "Destination Required",
                              message: "Please select your destination",
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(8),
                              borderRadius: 8,
                              blockBackgroundInteraction: true,
                              dismissDirection:
                              FlushbarDismissDirection.VERTICAL,
                            )..show(context);
                            return;


                          }
                          else  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ShowVehicles(destination: selecteddistrictdes,startlocation: selecteddistrict,vehicletype:selectedvehicletype,departure_date: _departure_dateController.text,)),
                            );





                      },













                      child: Text("Search"),

                    )
                  ],

                ),
              )
              ;}else{return CircularProgressIndicator();}}
      ),
    );
  }
}
