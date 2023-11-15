import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:native_screenshot_ext/native_screenshot_ext.dart';
import 'package:screenshot/screenshot.dart';
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
  String x="";
  ScreenshotController screenshotController=ScreenshotController();
  TextEditingController controller=TextEditingController();
  String? headertext,footertext;
  File? file1;
  File? image;
  Future pickImage(ImageSource source) async
  {
    try{
      final image=await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imagetemp=File(image.path);
      setState(() {
        this.image=imagetemp;

      });
    }
    on PlatformException catch (e)
    {
      return showDialog(
        context:context,
        builder:(BuildContext context) 
        {return AlertDialog(title:Text("Failed to pick image:"),
        content:Text("$e"),
        );
        }
      );
    } 
  }
  
  takescreenshot (BuildContext context)
{
 screenshotController.capture().then((Uint8List? image)
 {
  savescreenshot(image!);
 });
}
savescreenshot(Uint8List bytes)async{
  final time=DateTime.now();
  final name="screensht";
  
  await ImageGallerySaver.saveImage(bytes,name: name);
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:SingleChildScrollView(child:Column(
        children: [
        //  Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
          SizedBox(height:50),
          //Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
          Container(
            height:500,
            width:500,
            child:Screenshot(
            
            controller: screenshotController,
  //          key:globalkey,
            child:
          Stack(

      children: [
        //Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
        image!=null?Image.file(image!,height: 300,fit: BoxFit.cover,width: 300,):Container(height:300,
        color: Colors.amber,

        ),
        Align(
alignment: Alignment.center,
child: TextButton(child:Text("Click Here to Add Image"),onPressed: () {pickImage(ImageSource.gallery);},),
        ),

        Container(
          padding: EdgeInsets.all(11),
          child:Column(
            
            children: [
              Text("${headertext}",style: TextStyle(color: Colors.white),),
              
              //Text("bye",style: TextStyle(color:Colors.white),)
            ],
          )
        )
      ],
          ) )),
  //        SizedBox(height: 10,),
          TextField(
            controller: controller,
            onChanged:(value) {
              setState(() {
                headertext=value;
              });
            },
            decoration: InputDecoration(
            hintText: "enter upper text",
            
          ),),
          SizedBox(height: 10,),
          TextField(
            onChanged:(value) {
             
             // footertext=value!;
            },
            decoration: InputDecoration(
            hintText: "enter footer text",  
          ),
          ),
          ElevatedButton(onPressed: (){takescreenshot(context);}
          , child: Text("Save"))    
          
        ],
      ),
      
      )
    );
  }
}