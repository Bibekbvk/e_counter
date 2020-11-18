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
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Todays Fair",)
      ),
       body:Card(
         color: Colors.yellow,
                child: Padding(
           padding: const EdgeInsets.all(11.0),
           
           child: StreamBuilder(
           stream: firestoreDb,
           builder: (context, snapshot){
             if(! snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {
               
                return Text(snapshot.data.documents[index]['Cost'], style: TextStyle( 
                  fontSize:16.0, fontWeight: FontWeight.w800
                ), ); 

                
              },
              


                 
              
                
               
             
                 

            );
           }
           ),
         ),
       ),



    );
  }
}