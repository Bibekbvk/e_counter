import 'package:e_counter/Book.dart';
import 'package:e_counter/Homepage/TicketBooking/display_ticket.dart';

import 'package:e_counter/database.dart';

import 'package:e_counter/main.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Database db = new Database();
  Book book = new Book();
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Ticket')),
        ),
        body: Center(
          child: ListView.builder(itemCount: id.length,itemBuilder: (BuildContext context,int index){
            return Padding(
              padding:  EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(



                height: MediaQuery.of(context).size.height*0.08,

                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blue[100], Colors.white]),

                borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Myticket(num:index.toString())));
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      Text("Choose Ticket No.(${index+1})", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_forward_ios_sharp, size: 15,color: Colors.black,),


                    ],
                  ),
                ),
              ),
            );


          }

          ),
        ));
  }
}
