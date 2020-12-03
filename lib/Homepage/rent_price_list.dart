import 'package:e_counter/Models/RentModel.dart';
import 'package:e_counter/Models/movers_model.dart';
import 'package:flutter/material.dart';

class RentPriceList extends StatefulWidget {
  final RentModel model;

  const RentPriceList({Key key, this.model}) : super(key: key);
  @override
  _RentPriceListState createState() => _RentPriceListState();
}

class _RentPriceListState extends State<RentPriceList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: widget.model.price_list.length,itemBuilder: (BuildContext context, int index){
      return Center(child: Text("${widget.model.price_list[index]}"));});
  }
}