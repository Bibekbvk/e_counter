import 'package:e_counter/database.dart';
import 'package:flutter/material.dart';
class ShowVehicles extends StatefulWidget {
  @override
  final String date;

  const ShowVehicles({Key key, this.date}) : super(key: key);
  _ShowVehiclesState createState() => _ShowVehiclesState();
}

class _ShowVehiclesState extends State<ShowVehicles> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:db.getfirebase(widget.date) , builder: (context, snapshot){
        if(snapshot.hasData){
          print(snapshot);
          return Text(snapshot.data[0].price.toString());
        }
        else{
          return CircularProgressIndicator();
        }

      }),
    );
  }
}
