import 'dart:io';

import 'package:flutter/material.dart';

class homepage extends StatefulWidget
{
@override
homepage1 createState()
{
  return homepage1();
}
}
class homepage1 extends State<homepage>
{
  String? headertext,footertext;
  File? file1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(child:Column(
        children: [
          Image.network(""),
          SizedBox(height:12),
          Image.network(""),
          Stack(
      children: [
        file1!=null?Image.file(file1!,height: 300,):Container(),
        Container(
          padding: EdgeInsets.all(11),
          child:Column(
            children: [
              Text(headertext!),
              Spacer(),
              Text(footertext!)
            ],
          )
        )
      ],
          ),
          SizedBox(height: 10,),
          TextField(
            onChanged:(value) {
              headertext=value!;


            },
            decoration: InputDecoration(
            hintText: "enter upper text",
            
          ),),
          SizedBox(height: 10,),
          TextField(
            onChanged:(value) {
              footertext=value!;
            },
            decoration: InputDecoration(
            hintText: "enter footer text",  
          ),
          ),
          ElevatedButton(onPressed: (){
            screenshot();

          }, child: Text("Save"))    
          
        ],
      ),
      
      )
    );
  }
screenshot()
{
  
}
}