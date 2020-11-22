
import 'package:e_counter/Models/movers_model.dart';
import 'package:flutter/material.dart';

class MoversPriceList extends StatefulWidget {
  final MoversModel model;

  const MoversPriceList({Key key, this.model}) : super(key: key);
  @override
  _MoversPriceListState createState() => _MoversPriceListState();
}

class _MoversPriceListState extends State<MoversPriceList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: widget.model.price_list.length,itemBuilder: (BuildContext context, int index){
      return Text("${widget.model.price_list[index]}");});
  }
}
