import 'package:dropdown_search/dropdown_search.dart';
import 'package:e_counter/Homepage/TicketBooking/showvehicles.dart';
import 'package:e_counter/database.dart';

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

  String selecteddistrict="";
  List<String> hints ;
  double frombutton=0;
  double destinationbutton=0;
  Database db = Database();
  String selectedtime="";
  String hint="";
  TextEditingController _departure_dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

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
                                _departure_dateController.text=dates;
                              });
                        },
                        controller: _departure_dateController,
                        keyboardType: TextInputType.text,
                        validator: (value) => value.isEmpty ? 'Date is required' : null,
                        decoration: InputDecoration(
                            labelText: "Departure Date",
                            border: OutlineInputBorder(

                            )),
                      ),
                    ),

                    RaisedButton(


                      onPressed: (){
                        if (_formKey.currentState.validate()) {
                          //form is valid, proceed further
                          _formKey.currentState.save();//save once fields are valid, onSaved method invoked for every form fields

                        }

                        Navigator.push(
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