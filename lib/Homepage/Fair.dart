import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Calculate extends StatefulWidget {
  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
   var firestoreDb = FirebaseFirestore.instance.collection("Fair").snapshots();
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Todays Fair",))
      ),
       body:Padding(
           padding: const EdgeInsets.all(11.0),

           child: StreamBuilder(
           stream: firestoreDb,
           builder: (context, snapshot){
             if(! snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(

              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {

       return
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(

             height: MediaQuery.of(context).size.height*0.08,

             decoration: BoxDecoration(


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
             child: Center(
               child: Text("${snapshot.data.documents[index]['Cost']}", style: TextStyle(
               fontSize:16.0, fontWeight: FontWeight.w800
       ), ),
             ),
           ),
         );


              },










            );
           }
           ),
         ),



    );
  }
}