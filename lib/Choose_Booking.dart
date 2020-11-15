import 'package:dropdown_search/dropdown_search.dart';
import 'package:e_counter/database.dart';
import 'package:e_counter/districts_search.dart';
import 'package:e_counter/showvehicles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChooseBooking extends StatefulWidget {
  @override
  _ChooseBookingState createState() => _ChooseBookingState();
}

class _ChooseBookingState extends State<ChooseBooking> {

  @override
  final TextEditingController _dateController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(

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


        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
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
                          onChanged: (val){
                            selecteddistrictdes = val;
                          },
                          selectedItem: selecteddistrictdes),
                    ),
                  ],),
              ),
            ],),

            Padding(
              padding: EdgeInsets.fromLTRB(20,10,20,10),
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  label: "Vehicle Type",
                  showSelectedItem: true,
                  items:vehicletype,
                  onChanged: (val){
                    selectedvehicletype = val;
                  },
                  selectedItem: selectedvehicletype),
            ),

            RaisedButton(
              onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowVehicles(destination: selecteddistrictdes,startlocation: selecteddistrict,vehicletype:selectedvehicletype)),
                );
              },
              child: Text("Search"),
            )
          ],

        );}else{return CircularProgressIndicator();}}
      ),
    );
  }
}
