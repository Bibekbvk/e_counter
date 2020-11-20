import 'package:e_counter/Book.dart';
import 'package:e_counter/Models/ReserveModel.dart';
import 'package:e_counter/Models/book_model.dart';
import 'package:e_counter/Models/movers_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class seatSumo extends StatefulWidget {
  @override
  final BookModel usermodel;
  final ReserveModel reservemodel;
  final MoversModel moversmodel;
  const seatSumo({Key key, this.usermodel, this.reservemodel, this.moversmodel, }) : super(key: key);
  _seatSumoState createState() => _seatSumoState();
}

class _seatSumoState extends State<seatSumo> {
  Color color = Colors.red;

  List<Color> sumoColor;

  var ticketListSumo = ["Sumo_ticket"];

  @override

  void init(){

    for(var k=0;k<9;k++){
      if(sumoColor==null){
        sumoColor=[Colors.red];
      }
      else{
        sumoColor.add(Colors.red);}
    }


  }

  Widget build(BuildContext context) {
    init();
    return Scaffold(
        floatingActionButton: RaisedButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Book(usermodel: widget.usermodel,moversmodel: widget.moversmodel,reservemodel: widget.reservemodel,seatnumber: ticketListSumo,)));



        },child: Text("Select"),),
        body: ListView(
          children: [
            Column(children: <Widget>[
              Container(
                width: 305,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child:       Column(
                  children: [


                       Column(
                        children: [
                          Row(
                            children: [
                              seatSumo("1",0),
                              SizedBox(width: 70),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black, width: 3)),
                                  height: 60,
                                  width: 60,
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
                              seatSumo("2",1),
                              SizedBox(width:10),
                              seatSumo("3",2),
                              SizedBox(width:10),
                              seatSumo("4",3),
                              SizedBox(width:10),
                              seatSumo("5",4),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              seatSumo("6",5),
                              SizedBox(width:10),
                              seatSumo("7",6),
                              SizedBox(width:10),
                              seatSumo("8",7),
                              SizedBox(width:10),
                              seatSumo("9",8),
                            ],
                          )
                        ],
                      ),

                  ],
                ),
              )
            ]),

          ],
        ));
  }


  Widget seatSumo(String seat,int index){
    return InkWell(
      onTap: (){
        setState(() {
          if(sumoColor[index]==Colors.red){
            sumoColor[index] = Colors.green;
            ticketListSumo.add(seat);
            print(ticketListSumo);
          }

          else{

            sumoColor[index]=Colors.red;
            ticketListSumo.remove(seat);
            print(ticketListSumo);

          }
        });

      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: sumoColor[index], width: 3)),
        height: 60,
        width: 60,
        child: Text(
          "$seat",
          style: TextStyle(
            fontSize: 33,
          ),
        ),
      ),
    );

  }

}




