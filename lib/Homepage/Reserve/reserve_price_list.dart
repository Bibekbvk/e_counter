
import 'package:e_counter/Models/ReserveModel.dart';
import 'package:flutter/material.dart';

class ReservePriceList extends StatefulWidget {
  final ReserveModel model;

  const ReservePriceList({Key key, this.model}) : super(key: key);
  @override
  _ReservePriceListState createState() => _ReservePriceListState();
}

class _ReservePriceListState extends State<ReservePriceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemCount: widget.model.price_list.length,itemBuilder: (BuildContext context, int index){
        return Text("${widget.model.price_list[index]}");


      }),
    );
  }
}
