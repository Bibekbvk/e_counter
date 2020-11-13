import 'package:e_counter/Book.dart';
import 'package:e_counter/database.dart';
import 'package:flutter/material.dart';
class ShowVehicles extends StatefulWidget {
  @override

  final String destination;
  final String startlocation;
  const ShowVehicles({Key key, this.destination, this.startlocation}) : super(key: key);
  _ShowVehiclesState createState() => _ShowVehiclesState();
}

class _ShowVehiclesState extends State<ShowVehicles> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:db.getfirebase(widget.destination,widget.startlocation) , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){
            return Padding(
              padding:  EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
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
                child: Column(
                  children: [
                    Text(snapshot.data[index].destination.toString()),
                    Text(snapshot.data[index].price.toString()),
                    Text(snapshot.data[index].type.toString()),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(onPressed: (){
                        print("${Text(snapshot.data[index].destination.toString())}");
                        String from = snapshot.data[index].destination.toString();
                        String to  = snapshot.data[index].startlocation.toString();
                        String shift = snapshot.data[index].shift.toString();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Book(from: from,to: to,shift: shift,)));

                      },child: Text("Book"),),
                    )


                  ],
                ),
              ),
            );
          });
        }
        else{
          return CircularProgressIndicator();
        }

      }),
    );
  }
}
