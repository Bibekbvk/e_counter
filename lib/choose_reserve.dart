import 'package:e_counter/ViewReserve.dart';
import 'package:e_counter/districts_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChooseReserve extends StatefulWidget {
  @override
  _ChooseReserveState createState() => _ChooseReserveState();
}
TextEditingController _fromController = TextEditingController();

TextEditingController _toController = TextEditingController();
TextEditingController _departure_dateController = TextEditingController();

class _ChooseReserveState extends State<ChooseReserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          TextField(
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DistrictSearch(searched: _fromController,)),
              );},
            controller: _fromController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: "From",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextField(
      onTap: (){

              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DistrictSearch(searched: _toController,)),
              );},
            controller: _toController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: "To",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
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
            validator: (val) =>
            val.isEmpty ? "Enter Vehicle Number" : null,
            decoration: InputDecoration(
                labelText: "Departure Date",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReserveList(location: _toController.text,)),
              );
            },
            child: Text("Search"),
          )



        ],


      ),
    );
  }
}
