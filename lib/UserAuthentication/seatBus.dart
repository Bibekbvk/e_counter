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
  var ticketListBus = ["Bus_ticket"];
  @override
  void init(){
    for(var l=0;l<37;l++){
      if(busColor==null){
        busColor=[Colors.grey];
      }
      else{
        busColor.add(Colors.grey);}
    }

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
                          seatUi("A",35),
                          SizedBox(width: 35),
                          seatUi("B",36),
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
                        seatUi("B1",1),
                        SizedBox(width: 15),
                        seatUi("B2",2),
                      ]),
                    ),
                    SizedBox(
                      width: 2,
                      child: Container(height: 1, color: Colors.black54),
                    ),
                    seatRow("A1",3,"A2",4,"B3",5,"B4",6),
                    SizedBox(height: 10),
                    seatRow("A3",7,"A4",8,"B5",9,"B6",10),
                    SizedBox(height: 10),
                    seatRow("A5",11,"A6",12,"B7",13,"B8",14),
                    SizedBox(height: 10),
                    seatRow("A7",15,"A8",16,"B9",17,"B10",18),
                    SizedBox(height: 10),
                    seatRow("A9",19,"A10",20,"B11",21,"B12",22),
                    SizedBox(height: 10),
                    seatRow("A11",23,"A12",24,"B13",25,"B14",26),
                    SizedBox(height: 10),
                    seatRow("A13",27,"A14",28,"B15",29,"B16",30),
                    SizedBox(height: 10),
                    seatRow("A15",31,"A16",32,"B17",33,"B18",34),
                    SizedBox(height: 10),
                    Expanded(
                      child: RaisedButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Book(usermodel: widget.usermodel,moversmodel: widget.moversmodel,reservemodel: widget.reservemodel,seatnumber: ticketListBus,)));
                        },child: Text("Select"),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  Widget seatUi(String seat,int index) {
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            if(busColor[index]==Colors.grey){
              busColor[index] = Colors.green;
              ticketListBus.add(seat);
              print(ticketListBus);
            }
            else{
              busColor[index]=Colors.grey;
              ticketListBus.remove(seat);
            print(ticketListBus);
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: busColor[index], width: 3),borderRadius: BorderRadius.circular(10)),
          height: 55,
          width: 55,
          child: Center(
            child: Text(
              "$seat",
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
  Widget seatRow(String left,int leftnum, String leftmid, int leftmidnum,String rightmid,int rightmidnum, String right,int rightnum){
    return   Expanded(
      child: Row(children: [
        seatUi(left,leftnum),
        SizedBox(width: 5),
        seatUi(leftmid,leftmidnum),
        SizedBox(
          width: 35,
        ),
        seatUi(rightmid ,rightmidnum),
        SizedBox(width: 5),
        seatUi(right,rightnum),
      ]),
    );
  }
}




