import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class VechicleCard extends StatefulWidget {
  @override

  final List<String> upper;
  final List<String> lower;
  final btn1onPressed;
  final String btn1title;
  final String title;
  final String imageurl;


  const VechicleCard({Key key, this.upper, this.lower, this.btn1onPressed, this.btn1title, this.title, this.imageurl}) : super(key: key);
  _VechicleCardState createState() => _VechicleCardState();
}


class _VechicleCardState extends State<VechicleCard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> text=[ Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("${widget.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ResponsiveFlutter.of(context).fontSize(2)),),
      ),
    ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,0,20,0),
          child: Image.network("${widget.imageurl}"),
        ),
      ),
      ] ;


    var up = widget.upper.length;
    double cardheight = widget.upper.length.toDouble()*1.2/10;
    print(widget.upper.length);


    for(var i=0;i<up-1;i=i+2){
        text.add(Expanded(
            flex: 2,
            child: textColumn(widget.upper[i],widget.lower[i],widget.upper[i+1],widget.lower[i+1])));
    }
    text.add(RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(40.0))),
      onPressed: widget.btn1onPressed, child: Text("${widget.btn1title}",style: TextStyle(color: Colors.black,fontSize: ResponsiveFlutter.of(context).fontSize(2)),),));

    return Padding(
      padding:  EdgeInsets.fromLTRB(50,20,50,20),
      child: Container(
        height: MediaQuery.of(context).size.height*cardheight,
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
        child:Column(
          children:text,
        ),
      ),
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
