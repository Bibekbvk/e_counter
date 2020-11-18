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
      appBar: AppBar(),
      body: Center(
      child:
      ListView.builder(itemCount: id.length,itemBuilder: (BuildContext context,int index){
        return Column(
          children: [
            RaisedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Myticket(num:index.toString())));



            },child: Text("Check"),),
            Text("Ticket Number : ${id[index]}"),


          ],
        );


      }

    ),



      ));
  }
}
