
import 'package:e_counter/Homepage/Homepage.dart';
import 'package:e_counter/Reuseable_codes/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import 'package:responsive_flutter/responsive_flutter.dart';


class ConfirmedPurchase extends StatefulWidget {
  final String title;
  final String text;

  const ConfirmedPurchase({Key key, this.title, this.text}) : super(key: key);
  @override
  _ConfirmedPurchaseState createState() => _ConfirmedPurchaseState();
}

class _ConfirmedPurchaseState extends State<ConfirmedPurchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(

          children: [Expanded(
              flex: 3,
              child: Container(child:  Lottie.network('https://assets7.lottiefiles.com/packages/lf20_Z77us6.json',repeat: false))),
            Expanded(
              flex: 2,
              child: Container(child: Column(
                children: [
                  Text('${widget.title}',style:TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(3.5),fontWeight: FontWeight.bold)),
                  Text('${widget.text}'),
                ],
              ),),),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child:  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      color: kPrimaryColor,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Continue',style: TextStyle(color: Colors.white,fontSize:ResponsiveFlutter.of(context).fontSize(3.5) ),),
                      ),
                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    e_counter()));
                      }
                  ),
                )),
          ],

        )


    );


  }
}