import 'package:e_counter/Book.dart';
import 'package:e_counter/Models/ReserveModel.dart';
import 'package:e_counter/Models/book_model.dart';
import 'package:e_counter/Models/movers_model.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class seatHiace extends StatefulWidget {
  @override
  final BookModel usermodel;
  final ReserveModel reservemodel;
  final MoversModel moversmodel;
  const seatHiace({Key key, this.usermodel, this.reservemodel, this.moversmodel, }) : super(key: key);
  _seatHiaceState createState() => _seatHiaceState();
}



class _seatHiaceState extends State<seatHiace> {
  Color color = Colors.red;
  List<Color> hiaceColor;
  List<Color> sumoColor;
  List<Color> busColor;
  var ticketListHiace = ["Hiace_ticket"];
  List seatnum = ["a","A","B","1","2","3","4","5","6","7","8","9","10","11","12","13"];

  @override

  void init(){
    print("${widget.usermodel.seat_num}seaatt");

    for(var i=0;i<20;i++){
      if(hiaceColor==null){
        hiaceColor=[Colors.grey];
      }
      else{
        hiaceColor.add(Colors.grey);}
    }
    for(var each in seatnum){
      if(widget.usermodel.seat_num!=null){
        for(var seatn in widget.usermodel.seat_num){
          if(each==seatn){
            hiaceColor[seatnum.indexOf(each)+1]=Colors.red;

          }}

      }}



  }

  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(title: Text("Tap to Select Seat")),
        floatingActionButton: RaisedButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Book(usermodel: widget.usermodel,moversmodel: widget.moversmodel,reservemodel: widget.reservemodel,seatnumber: ticketListHiace,)));



        },child: Text("Select"),),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2),borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Expanded(
                  child: Row(
                    children: [
                      seathiace("B",15),
                      SizedBox(width: 15),
                      SizedBox(width: 15),
                      seathiace("A",14),
                      SizedBox(width: 15),
                      SizedBox(width: 35),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54, width: 3)),
                          height: 75,
                          width: 75,
                          child: Text(
                            "Driver",
                            style: TextStyle(
                              fontSize: 33,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Row(
                    children: [
                      Text("Door",
                          style: TextStyle(
                            fontSize: 30,
                          )),
                      seathiace("1",1),
                      SizedBox(width: 15),
                      seathiace("2",2),
                      SizedBox(width: 15),
                      seathiace("3",3),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      seathiace("4",4),
                      SizedBox(width: 80),
                      seathiace("5",5),
                      SizedBox(width: 15),
                      seathiace("6",6),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      seathiace("7",7),
                      SizedBox(width: 80),
                      seathiace("8",8),
                      SizedBox(width: 15),
                      seathiace("9",9),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      seathiace("10",10),
                      SizedBox(width: 15),
                      seathiace("11",11),
                      SizedBox(width: 10),
                      seathiace("12",12),
                      SizedBox(width: 10),
                      seathiace("13",13),
                    ],
                  ),
                ),
              ]),
            ),

          ],
        ));
  }
  Widget seathiace(String seat,int index){

    return Expanded(
      child: InkWell(
        onTap: (){

          setState(() {
            if(hiaceColor[index]==Colors.grey){
              ticketListHiace.add(seat);
              print(ticketListHiace);
              hiaceColor[index] = Colors.green;}
            else if(hiaceColor[index]==Colors.green){
                 ticketListHiace.remove(seat);
                 print(ticketListHiace);
              hiaceColor[index]=Colors.grey;
            }
          });
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: hiaceColor[index], width: 3),borderRadius: BorderRadius.circular(10)),
            height: 60,
            width: 60,
            child: Center(
              child: Text(
                "$seat",
                style: TextStyle(
                  fontSize: 33,
                ),
              ),
            )),
      ),
    );
  }


}




