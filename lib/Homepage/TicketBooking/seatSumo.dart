import 'package:e_counter/Book.dart';
import 'package:e_counter/Models/ReserveModel.dart';
import 'package:e_counter/Models/book_model.dart';
import 'package:e_counter/Models/movers_model.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:flushbar/flushbar.dart';
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
  List seatnum = ["1","2","3","4","5","6","7","8","9"];

  @override

  void init(){

    for(var k=0;k<13;k++){
      if(sumoColor==null){
        sumoColor=[Colors.grey];
      }
      else{
        sumoColor.add(Colors.grey);}
    }
    for(var each in seatnum){
      print('${widget.usermodel.seat_num}//seatnumberrrrr');
      if(widget.usermodel.seat_num!=null){
        for(var seatn in widget.usermodel.seat_num){
          if(each==seatn){
            print(each);
            print(seatn);
            sumoColor[seatnum.indexOf(each)]=Colors.red;

          }}

      }}


  }

  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(title: Text("Tap To Select"),),
        floatingActionButton: RaisedButton(onPressed: (){
          if(ticketListSumo.length<=1){
            Flushbar(
              backgroundColor: Colors.red[600],
              flushbarPosition:
              FlushbarPosition.TOP,
              flushbarStyle:
              FlushbarStyle.FLOATING,
              title: "Seat Not Selected",
              message: "Tap to Select ",
              duration: Duration(seconds: 2),
              margin: EdgeInsets.all(8),
              borderRadius: 8,
              blockBackgroundInteraction: true,
              dismissDirection:
              FlushbarDismissDirection
                  .VERTICAL,
            )
              ..show(context);
            return;
          }else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Book(usermodel: widget.usermodel,
                          moversmodel: widget.moversmodel,
                          reservemodel: widget.reservemodel,
                          seatnumber: ticketListSumo,)));
          }


        },child: Text("Select"),),
        body: ListView(
          children: [
            Column(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kPrimaryColor, width: 1)),
                child:       Column(
                 children: [
                   Expanded(
                     child: Row(
                       children: [
                         seatSumo("1",0),
                         SizedBox(width: 70),
                         Expanded(
                           child: Container(
                               decoration: BoxDecoration(
                                   border: Border.all(color: kPrimaryColor, width: 3)),

                               child: Text(
                                 "Driver",
                                 style: TextStyle(
                                   fontSize: 33,
                                 ),
                               )),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 15),
                   Expanded(
                     child: Row(
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
                   ),
                   SizedBox(height: 15),
                   Expanded(
                     child: Row(
                       children: [
                         seatSumo("6",5),
                         SizedBox(width:10),
                         seatSumo("7",6),
                         SizedBox(width:10),
                         seatSumo("8",7),
                         SizedBox(width:10),
                         seatSumo("9",8),
                       ],
                     ),
                   )
                 ],
                      ),
              )
            ]),

          ],
        ));
  }


  Widget seatSumo(String seat,int index){
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            if(sumoColor[index]==Colors.grey){
              sumoColor[index] = Colors.green;
              ticketListSumo.add(seat);
              print(ticketListSumo);
            }

            else if(sumoColor[index]==Colors.green){

              sumoColor[index]=Colors.grey;
              ticketListSumo.remove(seat);
              print(ticketListSumo);

            }
          });

        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
      ),
    );

  }

}




