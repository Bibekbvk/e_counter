import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class seatBus extends StatefulWidget {
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
        busColor=[Colors.red];
      }
      else{
        busColor.add(Colors.red);}
    }

  }

  Widget build(BuildContext context) {
    init();
    return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: 305,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 2)),
              child: Column(
                children: [
                  Row(
                    children: [
                      seatUi("A",35),
                      SizedBox(width: 35),
                      seatUi("B",36),
                      SizedBox(width: 35),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3)),
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
                  Text("Cabin"),
                  Row(children: [
                    Text(
                      "Dooor     Way",
                      style: TextStyle(fontSize: 24),
                    ),

                    seatUi("B1",1),

                    SizedBox(width: 15),
                    seatUi("B2",2),
                  ]),
                  SizedBox(
                    width: 2,
                    child: Container(height: 1, color: Colors.black54),
                  ),
                  Row(children: [
                    seatUi("A1",3),
                    SizedBox(width: 5),
                    seatUi("A2",4),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B3",5),
                    SizedBox(width: 5),
                    seatUi("B4",6),
                  ]),
                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A3",7),
                    SizedBox(width: 5),
                    seatUi("A4",8),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B5",9),
                    SizedBox(width: 5),
                    seatUi("B6",10),
                  ]),

                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A5",11),
                    SizedBox(width: 5),
                    seatUi("A6",12),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B7",13),
                    SizedBox(width: 5),
                    seatUi("B8",14),
                  ]),

                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A7",15),
                    SizedBox(width: 5),
                    seatUi("A8",16),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B9",17),
                    SizedBox(width: 5),
                    seatUi("B10",18),
                  ]),


                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A9",19),
                    SizedBox(width: 5),
                    seatUi("A10",20),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B11",21),
                    SizedBox(width: 5),
                    seatUi("B12",22),
                  ]),
                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A11",23),
                    SizedBox(width: 5),
                    seatUi("A12",24),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B13",25),
                    SizedBox(width: 5),
                    seatUi("B14",26),
                  ]),

                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A13",27),
                    SizedBox(width: 5),
                    seatUi("A14",28),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B15",29),
                    SizedBox(width: 5),
                    seatUi("B16",30),
                  ]),

                  Row(children: [
                    seatUi("A15",31),
                    SizedBox(width: 5),
                    seatUi("A16",32),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B17",33),
                    SizedBox(width: 5),
                    seatUi("B18",34),
                  ]),




                ],
              ),
            )
          ],
        ));
  }




  Widget seatUi(String seat,int index) {
    return InkWell(
      onTap: (){
        setState(() {
          if(busColor[index]==Colors.red){
            busColor[index] = Colors.green;
            ticketListBus.add(seat);
            print(ticketListBus);
          }

          else{

            busColor[index]=Colors.red;

            ticketListBus.remove(seat);
          print(ticketListBus);

          }
        });

      },
      child: Container(
        decoration:
        BoxDecoration(border: Border.all(color: busColor[index], width: 3)),
        height: 55,
        width: 55,
        child: Text(
          "$seat",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}




