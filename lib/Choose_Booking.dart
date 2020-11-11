import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChooseBooking extends StatefulWidget {
  @override
  _ChooseBookingState createState() => _ChooseBookingState();
}

class _ChooseBookingState extends State<ChooseBooking> {

  @override
  final TextEditingController _initialpriceController = TextEditingController();
  final TextEditingController _finalpriceController = TextEditingController();
  List<String> district = ["Kathmandu", "Pokhara","Taplejung"];
  String selected;
  String selecteddistrict;
  String selectedtime;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              items: ["Day","Night"],
              label: "Time",
              onChanged: (val){
                selectedtime = val;

              },
              selectedItem: selected),
          Text("Travel Location"),
          SizedBox(height: MediaQuery.of(context).size.height*0.03),
          DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              items: ["Please Select Province","Province 1", "Province 2", "Province 3", 'Province 4'],
              label: "Province",
              onChanged: (val){
                selected = val;
                print(val);
                if(val=="Province 1"){
                  setState(() {
                    district=["Taplejung", "Bardiya"];

                  });
                }
                else if(val=="Province 2"){
                  setState(() {
                    district=["Lumbini", "Bhairava", "Surkhet"];

                  });
                }
              },
              selectedItem: selected),
          DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              items: district,
              label: "Country",
              onChanged: (val){
                selecteddistrict=val;

              },
              selectedItem: selecteddistrict),
          Text("Travel Destination"),
          SizedBox(height: MediaQuery.of(context).size.height*0.03),
          DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              items: ["Please Select Province","Province 1", "Province 2", "Province 3", 'Province 4'],
              label: "Province",
              onChanged: (val){
                selected = val;
                print(val);
                if(val=="Province 1"){
                  setState(() {
                    district=["Taplejung", "Bardiya"];

                  });
                }
                else if(val=="Province 2"){
                  setState(() {
                    district=["Lumbini", "Bhairava", "Surkhet"];

                  });
                }
              },
              selectedItem: selected),
          DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              items: district,
              label: "Country",
              onChanged: (val){
                selecteddistrict=val;

              },
              selectedItem: selecteddistrict),
          RaisedButton(onPressed: (){
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

              String dates =  "${date.year}/${date.month}/${date.day} || (Time: ${date.hour}:${date.minute} $zone)";

            });
          },

          locale: LocaleType.en);
    },child: Text("Select Date"),


          ),

          



          RaisedButton(
            onPressed: (){

              var from = int.parse(_initialpriceController.text);
              var to =int.parse(_finalpriceController.text);
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DisplayByPrice(from:from,to:to,destination: selecteddistrict,)),
              );*/

            },
            child: Text("Search"),
          )

        ],

      ),
    );
  }
}
