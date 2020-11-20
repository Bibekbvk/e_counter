import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class seatGui extends StatefulWidget {
  @override
  _seatGuiState createState() => _seatGuiState();
}

class _seatGuiState extends State<seatGui> {
  Color color = Colors.red;
  List<Color> hiaceColor;
  List<Color> sumoColor;
  List<Color> busColor;


  @override

  void init(){
    for(var i=0;i<14;i++){
      if(hiaceColor==null){
        hiaceColor=[Colors.red];
      }
      else{
      hiaceColor.add(Colors.red);}
    }
    for(var k=0;k<8;k++){
      if(sumoColor==null){
        sumoColor=[Colors.red];
      }
      else{
        sumoColor.add(Colors.red);}
    }
    for(var l=0;l<39;l++){
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
            Column(children: <Widget>[
              Container(
                width: 305,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: Column(children: [
                  Row(
                    children: [
                      InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.black54, width: 3)),
                            height: 75,
                            width: 75,
                            child: Text("A"),
                          ),
                          onTap: () {
                            var list = ["ticket"];
                            list.add("A");
                          }),
                      SizedBox(width: 15),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54, width: 3)),
                        height: 75,
                        width: 75,
                        child: Text(
                          "B",
                          style: TextStyle(
                            fontSize: 33,
                          ),
                        ),
                      ),
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
                  SizedBox(height: 15),
                  Row(
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
                  SizedBox(height: 15),
                  Row(
                    children: [
                      seathiace("4",4),
                      SizedBox(width: 80),
                      seathiace("5",5),
                      SizedBox(width: 15),
                      seathiace("6",6),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      seathiace("7",7),
                      SizedBox(width: 80),
                      seathiace("8",8),
                      SizedBox(width: 15),
                      seathiace("9",9),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
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
                ]),
              )
            ]),
            Column(
              children: [
                Container(
                  width: 305,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.black54)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          seatSumo("1",0),
                          SizedBox(width: 40),
                          seatSumo("Driver",1),
                        ],
                      ),
                      SizedBox(width: 15),
                      Row(
                        children: [
                          seatSumo("2",2),
                          SizedBox(width: 15),
                          seatSumo("3",3),
                          SizedBox(width: 15),
                          seatSumo("4",4),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          seatSumo("5",5),
                          SizedBox(width: 15),
                          seatSumo("6",6),
                          SizedBox(width: 15),
                          seatSumo("7",7),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
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
                      InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 3)),
                            height: 75,
                            width: 75,
                            child: Text("A"),
                          ),
                          onTap: () {
                            var list = ["ticket"];
                            list.add("A");
                          }),
                      SizedBox(width: 15),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3)),
                        height: 75,
                        width: 75,
                        child: Text(
                          "B",
                          style: TextStyle(
                            fontSize: 33,
                          ),
                        ),
                      ),
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
                    InkWell(
                        child:  seatUi("A",1),
                        onTap: () {
                          var list = ["ticket"];
                          list.add("A");
                        }),
                    SizedBox(width: 15),
                    seatUi("B",2),
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
                    seatUi("B1",5),
                    SizedBox(width: 5),
                    seatUi("B2",6),
                  ]),
                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A3",7),
                    SizedBox(width: 5),
                    seatUi("A4",8),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B3",9),
                    SizedBox(width: 5),
                    seatUi("B4",10),
                  ]),

                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A5",11),
                    SizedBox(width: 5),
                    seatUi("A6",12),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B5",13),
                    SizedBox(width: 5),
                    seatUi("B6",14),
                  ]),

                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A5",15),
                    SizedBox(width: 5),
                    seatUi("A6",16),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B5",17),
                    SizedBox(width: 5),
                    seatUi("B6",18),
                  ]),


                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A7",19),
                    SizedBox(width: 5),
                    seatUi("A8",20),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B7",21),
                    SizedBox(width: 5),
                    seatUi("B8",22),
                  ]),
                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A9",23),
                    SizedBox(width: 5),
                    seatUi("A10",24),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B9",25),
                    SizedBox(width: 5),
                    seatUi("B10",26),
                  ]),

                  SizedBox(height: 10),

                  Row(children: [
                    seatUi("A11",27),
                    SizedBox(width: 5),
                    seatUi("A12",28),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B11",29),
                    SizedBox(width: 5),
                    seatUi("B12",30),
                  ]),

                  Row(children: [
                    seatUi("A13",31),
                    SizedBox(width: 5),
                    seatUi("A14",32),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B13",33),
                    SizedBox(width: 5),
                    seatUi("B14",34),
                  ]),

                  Row(children: [
                    seatUi("A15",35),
                    SizedBox(width: 5),
                    seatUi("A16",36),
                    SizedBox(
                      width: 35,
                    ),
                    seatUi("B15",37),
                    SizedBox(width: 5),
                    seatUi("B16",38),
                  ]),


                ],
              ),
            )
          ],
        ));
  }
  Widget seathiace(String seat,int index){

    return InkWell(
      onTap: (){
        setState(() {
          if(hiaceColor[index]==Colors.red){
            hiaceColor[index] = Colors.green;}
          else{

            hiaceColor[index]=Colors.red;


          }
        });
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: hiaceColor[index], width: 3)),
          height: 60,
          width: 60,
          child: Text(
            "$seat",
            style: TextStyle(
              fontSize: 33,
            ),
          )),
    );
  }
  Widget seatSumo(String seat,int index){
    return InkWell(
      onTap: (){
        setState(() {
          if(sumoColor[index]==Colors.red){
            sumoColor[index] = Colors.green;}
          else{

            sumoColor[index]=Colors.red;


          }
        });

      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: sumoColor[index], width: 3)),
        height: 75,
        width: 75,
        child: Text(
          "$seat",
          style: TextStyle(
            fontSize: 33,
          ),
        ),
      ),
    );

  }
  Widget seatUi(String seat,int index) {
    return InkWell(
      onTap: (){
        setState(() {
          if(busColor[index]==Colors.red){
            busColor[index] = Colors.green;}
          else{

            busColor[index]=Colors.red;


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




