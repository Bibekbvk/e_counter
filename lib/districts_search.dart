import 'package:flutter/material.dart';


class DistrictSearch extends StatefulWidget {
  @override
  _DistrictSearchState createState() => _DistrictSearchState();
}
final TextEditingController _locationController = TextEditingController();
List<String> district = ["Kathmandu","Pokhara","Dhadhing","Kaku"];
List hints=["Select","Kathmandu","Pokhara","Dhadhing","Kaku"];
class _DistrictSearchState extends State<DistrictSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          TextField(
            controller: _locationController,
            onChanged: (val){
              hints=["Select "];
              for(var each in district){
                if(val==each.substring(0,val.length)){
                  setState(() {
                    if(val.length==0){
                      hints=["Select","Kathmandu","Pokhara","Dhadhing","Kaku"];
                    }
                    else if(!hints.contains(each)){
                      hints.add(each);
                    }
                  });}
              }
            },
          ),
          ListView.builder( shrinkWrap: true,itemCount: hints.length,itemBuilder: (BuildContext context,int index){

            return InkWell(
              onTap: (){
                _locationController.text=hints[index];

              },
              child: Container(
                height: MediaQuery.of(context).size.height*0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${hints[index]}"),
                ),
              ),
            );

          }

          ,),]),
      ),
    );
  }
}
