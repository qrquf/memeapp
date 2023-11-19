import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:memeapp/apiconnection/imageapi.dart';
String h="";
class uploadmeme extends StatefulWidget
{
  //uploadmeme({String iss=""})
  //{
   // h=iss;
  //}
  @override
  uploadstate createState()
  {
    return uploadstate();
  }
}
class uploadstate extends State<uploadmeme>
{
  TextEditingController name=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController category=TextEditingController();
  File? img;
   Future pickImage( source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
      this.img = imagetemp;
      });
    } on PlatformException catch (e) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Failed to pick image:"),
              content: Text("$e"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Center(
          child:
          Column(
            children:[
           img != null? Image.file(img!):
            GestureDetector(
              onTap: (){
                pickImage(ImageSource.gallery);
              },
              child:
            Container(
              height:400,
              width:400,
              child:Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Plus_symbol.svg/1200px-Plus_symbol.svg.png")
            )
          ),
          SizedBox(height:10),
          TextFormField(
            controller:name,
           decoration: InputDecoration(
             hintText: "enter name of the meme" 
            ),
          ),
          SizedBox(height:10),
          TextFormField(
            controller:description ,
           decoration: InputDecoration(
             hintText: "enter the description of meme" 
            ),
          ),
          SizedBox(height:10),
          TextFormField(
            controller: category,
           decoration: InputDecoration(
             hintText: "enter the category" 
            ),
          ),
          
          
          ElevatedButton(
            child: Text("Make your meme live"),
            onPressed: (){
              httpServices13 http=httpServices13();
              http.saverec1(name.text.trim(),img!.path.trim() , description.text.trim(), category.text.toString());
            },
          )
          
        ])
      ),
    ));
  }
}