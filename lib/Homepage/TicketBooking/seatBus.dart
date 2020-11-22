import 'package:e_counter/Book.dart';
import 'package:e_counter/Models/ReserveModel.dart';
import 'package:e_counter/Models/book_model.dart';
import 'package:e_counter/Models/movers_model.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class seatBus extends StatefulWidget {
  final BookModel usermodel;
  final ReserveModel reservemodel;
  final MoversModel moversmodel;
  const seatBus({Key key, this.usermodel, this.reservemodel, this.moversmodel, }) : super(key: key);
  @override
  _seatBusState createState() => _seatBusState();
}
class _seatBusState extends State<seatBus> {
  Color color = Colors.red;
  List<Color> busColor;
  List ticketss;
  List seatnum = [" a","B1","B2","A1","A2","B3","B4","A3","A4","B5","B6","A5","A6","B7","B8","A7","A8","B9","B10","A9","A10","B11","B12","A11","A12","B13","B14","A13","A14","B15","B16","A15","A16","B17","B18","A","B"];
  @override
  void init(){

    for(var l=0;l<39;l++){

      if(busColor==null){
        busColor=[Colors.grey];
      }
      else{
        busColor.add(Colors.grey);}
    }
    for(var each in seatnum){
      if(widget.usermodel.seat_num!=null){
      for(var seatn in widget.usermodel.seat_num){
    if(each==seatn){
      busColor[seatnum.indexOf(each)]=Colors.red;

    }}

    }}

  }
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(title: Text("Tap to Select Seat"),),

        body: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0,10,0,10),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kPrimaryColor, width: 3)),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05,0,MediaQuery.of(context).size.width*0.05,0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          seatUi(35),
                          SizedBox(width: 35),
                          seatUi(36),
                          SizedBox(width: 35),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color:kPrimaryColor, width: 3)),
                              child: Center(
                                child: Text(
                                  "Driver",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: kPrimaryColor,

                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Expanded(child: Text("----Cabin----",style: TextStyle(

                      color: kPrimaryColor,

                    ),)),
                    Expanded(
                      child: Row(children: [
                        Text(
                          " Door Way    ",
                          style: TextStyle(fontSize: 24,     color: kPrimaryColor,),
                        ),
                        seatUi(1),
                        SizedBox(width: 15),
                        seatUi(2),
                      ]),
                    ),
                    SizedBox(
                      width: 2,
                      child: Container(height: 1, color: Colors.black54),
                    ),
                    seatRow(3,4,5,6),
                    SizedBox(height: 10),
                    seatRow(7,8,9,10),
                    SizedBox(height: 10),
                    seatRow(11,12,13,14),
                    SizedBox(height: 10),
                    seatRow(15,16,17,18),
                    SizedBox(height: 10),
                    seatRow(19,20,21,22),
                    SizedBox(height: 10),
                    seatRow(23,24,25,26),
                    SizedBox(height: 10),
                    seatRow(27,28,29,30),
                    SizedBox(height: 10),
                    seatRow(31,32,33,34),
                    SizedBox(height: 10),
                    Expanded(
                      child: RaisedButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Book(usermodel: widget.usermodel,moversmodel: widget.moversmodel,reservemodel: widget.reservemodel,seatnumber: ticketss,)));
                        },child: Text("Select"),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  Widget seatUi(int index) {
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {

            if(busColor[index]==Colors.grey){
              busColor[index] = Colors.green;
              if(ticketss==null){
                ticketss=[seatnum[index]];
              }
              else{
                ticketss.add(seatnum[index]);
                print(ticketss);
              }

            }
            else if(busColor[index]==Colors.green){
              busColor[index]=Colors.grey;

              ticketss.remove(seatnum[index]);
              print(ticketss);

            }
          });
        },
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: busColor[index], width: 3),borderRadius: BorderRadius.circular(10)),
          height: 55,
          width: 55,
          child: Center(
            child: Text(
              "${seatnum[index]}",
              style: TextStyle(
                fontSize: 20,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget seatRow(int leftnum,int leftmidnum,int rightmidnum,int rightnum){
    return   Expanded(
      child: Row(children: [
        seatUi(leftnum),
        SizedBox(width: 5),
        seatUi(leftmidnum),
        SizedBox(
          width: 35,
        ),
        seatUi(rightmidnum),
        SizedBox(width: 5),
        seatUi(rightnum),
      ]),
    );
  }
}




