import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class seatGui extends StatefulWidget {
  @override
  _seatGuiState createState() => _seatGuiState();
}

class _seatGuiState extends State<seatGui> {
  @override
  Widget build(BuildContext context) {
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
                 seathiace("1"),
                  SizedBox(width: 15),
                  seathiace("2"),
                  SizedBox(width: 15),
                 seathiace("3"),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                 seathiace("4"),
                  SizedBox(width: 80),
                 seathiace("5"),
                  SizedBox(width: 15),
                  seathiace("6"),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  seathiace("7"),
                  SizedBox(width: 80),
                  seathiace("8"),
                  SizedBox(width: 15),
                  seathiace("9"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                 seathiace("10"),
                  SizedBox(width: 15),
                 seathiace("11"),
                  SizedBox(width: 10),
                  seathiace("12"),
                  SizedBox(width: 10),
                  seathiace("13"),
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
                       seatSumo("1"),
                      SizedBox(width: 40),
                      seatSumo("Driver"),
                    ],
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      seatSumo("2"),
                      SizedBox(width: 15),
                       seatSumo("3"),
                      SizedBox(width: 15),
                       seatSumo("4"),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                       seatSumo("5"),
                      SizedBox(width: 15),
                      seatSumo("6"),
                      SizedBox(width: 15),
                     seatSumo("7"),
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
                    child:  seatUi("A"),
                    onTap: () {
                      var list = ["ticket"];
                      list.add("A");
                    }),
                SizedBox(width: 15),
                 seatUi("B"),
              ]),
              SizedBox(
                width: 2,
                child: Container(height: 1, color: Colors.black54),
              ),
              Row(children: [
                seatUi("A1"),
                SizedBox(width: 5),
                 seatUi("A2"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B1"),
                SizedBox(width: 5),
                seatUi("B2"),
              ]),
                 SizedBox(height: 10),

                 Row(children: [
                seatUi("A3"),
                SizedBox(width: 5),
                 seatUi("A4"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B3"),
                SizedBox(width: 5),
                seatUi("B4"),
              ]),

               SizedBox(height: 10),

                 Row(children: [
                seatUi("A5"),
                SizedBox(width: 5),
                 seatUi("A6"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B5"),
                SizedBox(width: 5),
                seatUi("B6"),
              ]),

               SizedBox(height: 10),

                 Row(children: [
                seatUi("A5"),
                SizedBox(width: 5),
                 seatUi("A6"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B5"),
                SizedBox(width: 5),
                seatUi("B6"),
              ]),


               SizedBox(height: 10),

                 Row(children: [
                seatUi("A7"),
                SizedBox(width: 5),
                 seatUi("A8"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B7"),
                SizedBox(width: 5),
                seatUi("B8"),
              ]),
               SizedBox(height: 10),

                 Row(children: [
                seatUi("A9"),
                SizedBox(width: 5),
                 seatUi("A10"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B9"),
                SizedBox(width: 5),
                seatUi("B10"),
              ]),

               SizedBox(height: 10),

                 Row(children: [
                seatUi("A11"),
                SizedBox(width: 5),
                 seatUi("A12"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B11"),
                SizedBox(width: 5),
                seatUi("B12"),
              ]),

               Row(children: [
                seatUi("A13"),
                SizedBox(width: 5),
                 seatUi("A14"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B13"),
                SizedBox(width: 5),
                seatUi("B14"),
              ]),

               Row(children: [
                seatUi("A15"),
                SizedBox(width: 5),
                 seatUi("A16"),
                SizedBox(
                  width: 35,
                ),
                seatUi("B15"),
                SizedBox(width: 5),
                seatUi("B16"),
              ]),
              
              
            ],
          ),
        )
      ],
    ));
  }
}

Widget seatUi(String seat) {
  return Container(
    decoration:
        BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
    height: 55,
    width: 55,
    child: Text(
      "$seat",
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

Widget seatSumo(String seat){
return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3)),
                    height: 75,
                    width: 75,
                    child: Text(
                      "$seat",
                      style: TextStyle(
                        fontSize: 33,
                      ),
                    ),
                  );

}

Widget seathiace(String seat){

  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 3)),
                      height: 60,
                      width: 60,
                      child: Text(
                        "13",
                        style: TextStyle(
                          fontSize: 33,
                        ),
                      )),
}