import 'package:e_counter/Book.dart';
import 'package:e_counter/database.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class ShowVehicles extends StatefulWidget {
  @override

  final String destination;
  final String startlocation;
  final String vehicletype;
  const ShowVehicles({Key key, this.destination, this.startlocation, this.vehicletype}) : super(key: key);
  _ShowVehiclesState createState() => _ShowVehiclesState();
}

class _ShowVehiclesState extends State<ShowVehicles> {
  @override
  Database db = new Database();
  Widget build(BuildContext context) {
    double heightquery = MediaQuery.of(context).size.height;
    double widthquery = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("${widget.startlocation} -  ${widget.destination}")),),
      body: StreamBuilder(stream:db.getfirebase("Damak","Kathmandu","bus") , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){
            return Padding(
              padding:  EdgeInsets.fromLTRB(0,5,0,0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.9,
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
                child:Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Maha Laxmi Delux",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ResponsiveFlutter.of(context).fontSize(2)),),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20,0,20,0),
                        child: Image.asset("buses.png"),
                      ),
                    ),
                    Expanded(
                        child: textColumn("Type","${snapshot.data[index].type}","Route", "Kathmandu-Damak")
                    ),
                    Expanded(
                        child: textColumn("Wifi","✅","Charging", "✅")
                    ),
                    Expanded(
                        child: textColumn("AC","✅","First Aid", "❌")
                    ),
                    Expanded(
                        child: textColumn("TV","✅","Music", "✅")
                    ),
                    Expanded(
                        child: textColumn("Driver Experience","-","Sub Driver", "✅")
                    ),
                    Expanded(
                        child: textColumn("BreakFast","","Lunch", "-")
                    ),
                    Expanded(
                        child: textColumn("seat type","","Offer", "")
                    ),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Expanded(child: Text("Price",style: TextStyle(color: Colors.grey,fontSize: ResponsiveFlutter.of(context).fontSize(2)))),
                            Expanded(child: Text("Rs 200",style: TextStyle(color: Colors.black,fontSize: ResponsiveFlutter.of(context).fontSize(2)),))
                          ],
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(40.0))),
                            onPressed: (){
                              print("${Text(snapshot.data[index].destination.toString())}");
                              String from = snapshot.data[index].startlocation.toString();
                              String to  = snapshot.data[index].destination.toString();
                              String shift = snapshot.data[index].shift.toString();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Book(from: from,to: to,shift: shift,)));

                            }
                            ,child: Text("Book",style: TextStyle(color: Colors.black,fontSize: ResponsiveFlutter.of(context).fontSize(2)),),),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            );



              /*Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.asset("car.png")),



                  *//*Wrap(
                    spacing: MediaQuery.of(context).size.width*0.4,
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Npr"),
                          Text("${snapshot.data[index].price.toString()}",style: TextStyle(fontSize: 40),),

                        ],
                      ),
                      Text("Type: Bus",style: TextStyle(fontSize: 15),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Facilities",style: TextStyle(fontSize: 20),),
                          Text("Wifi",style: TextStyle(fontSize: 10)),
                          Text("Phone Charge",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                      Text("offer:- 5 luccy winner will get cash back"),
                      Text("Driver Experience:"),
                      Text("Sub Driver"),
                      Text("Route:"),
                      Text("Breakfast:"),
                      Text("Lunch"),
                      Text("seat type"),

                    ],
                  ),*//*

                  Expanded(
                    child: RaisedButton(onPressed: (){

                    },child: Text("Book"),),
                  ),



                ],
              ),*/

          });
        }
        else{
          return CircularProgressIndicator();
        }

      }),
    );
  }
  Text uppertextstyle(String name){
    return Text("$name",style: TextStyle(color: Colors.grey,fontSize: ResponsiveFlutter.of(context).fontSize(2)));
  }
  Text lowertextstyle(String text){
    return  Text("$text",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ResponsiveFlutter.of(context).fontSize(2)),);
  }
  Row textColumn(String uppertext1, String lowertext1 , String uppertext2, String lowertext2){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            children: [
              uppertextstyle("$uppertext1"),
              Expanded(child: lowertextstyle("$lowertext1")),
            ],
          ),
        ),
        Expanded(
          child: Column(

            children: [
              uppertextstyle("$uppertext2"),
              Expanded(child: lowertextstyle("$lowertext2")),
            ],
          ),
        ),
      ],
    );
  }
}
