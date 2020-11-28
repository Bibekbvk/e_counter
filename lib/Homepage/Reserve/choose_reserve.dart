import 'package:dropdown_search/dropdown_search.dart';
import 'package:e_counter/Homepage/Reserve/ViewReserve.dart';
import 'package:e_counter/Homepage/TicketBooking/showvehicles.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:e_counter/database.dart';
import 'package:flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class ChooseReserve extends StatefulWidget {
  @override
  _ChooseReserveState createState() => _ChooseReserveState();
}

class _ChooseReserveState extends State<ChooseReserve> {

  @override
  List<String> district;
  List<String> vehicletype;
  String selected;

  String selectedvehicletype="";

  String selecteddistrict="";
  List<String> hints ;
  double frombutton=0;

  Database db = Database();
  String hint="";
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Book Ticket"))
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        flex:1,
                        child: Image.asset("assets/reserve.jpg")),
                    Expanded(
                      flex:1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Your Location", style:GoogleFonts.laila(fontSize: ResponsiveFlutter.of(context).fontSize(1.8),color: kPrimaryColor ,  fontWeight: FontWeight.bold),),
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

                            ],
                          ),

                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20,10,20,5),
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
                            ),
                          ),


                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: RaisedButton(
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

                                  else  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ReserveList(location: selecteddistrict,type:selectedvehicletype)),
                                    );





                                },













                                child: Text("Search", style: TextStyle(color: Colors.white),),

                              ),
                            ),
                          )
                        ],

                      ),
                    ),
                  ],
                ),
              )
              ;}else{return CircularProgressIndicator();}}
      ),
    );
  }
}
