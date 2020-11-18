import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class offers extends StatefulWidget {
  @override
  _offersState createState() => _offersState();
}



class _offersState extends State<offers> {
  var firestoreDb = FirebaseFirestore.instance.collection("offers").snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
    appBar: AppBar(
      title:Text("Offers")
     
    ),  

    body: Card(
      
      color: Colors.green,
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        
        child: StreamBuilder(
          
           stream: firestoreDb,
           builder: (context, snapshot){
             if(! snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              

              
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {
               
               
                return Text(snapshot.data.documents[index]['Offer 2'], style: TextStyle( 
                  fontSize:20.0, fontWeight: FontWeight.w800
                ), );  
              }
             
              

            );
           }
           ),
      ),
    ),
            backgroundColor: Colors.yellowAccent,
       
    );
  }
}