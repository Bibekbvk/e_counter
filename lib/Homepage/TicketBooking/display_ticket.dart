import 'package:e_counter/Book.dart';
import 'package:e_counter/database.dart';
import 'package:flutter/material.dart';

class Myticket extends StatefulWidget {
  final String num;

  const Myticket({Key key, this.num}) : super(key: key);

  @override
  _MyticketState createState() => _MyticketState();
}
Database db = new Database();
Book book = new Book();

class _MyticketState extends State<Myticket> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(stream:db.getuserticketfirebase(widget.num), builder: (context, snapshot){

          if(snapshot.hasData){

            return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){

              return Image.network(snapshot.data[index].link);

            },
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
      }),
    );
  }
}
