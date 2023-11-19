import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memeapp/apiconnection/imageapi.dart';
import 'package:memeapp/mainpage/page/home_page.dart';
//import 'package:native_screenshot_ext/native_screenshot_ext.dart';
import 'package:screenshot/screenshot.dart';
import 'package:text_editor/text_editor.dart';

 double fontsize1 = 3;
 double _currentSliderValue=0;
 String h="";
String email="";
var real=Colors.black;
class homepage2 extends StatefulWidget {
  homepage2({iss,String em=""})
  {email=em;
    h=iss;
  }
  @override
  homepage1 createState() {
    return homepage1();
  }
}

class homepage1 extends State<homepage2> {
  @override
  void init()
  {
    super.initState();
  }
  List<String> img=["https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Open_Sans_sample.svg/1200px-Open_Sans_sample.svg.png",
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR36DKU7wsGXKHsk_JI90LkrHfnj4UdRcKhRwafz-C3fhDuC_fK",
  "https://upload.wikimedia.org/wikipedia/commons/8/84/Montserrat_Specimen.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/SourceSansPro-sample.svg/800px-SourceSansPro-sample.svg.png",
  "https://imgs.fontbrain.com/imgs/3a/d8/58f18d2ee7bf6afc4155b15ffb6f/pt-720x360-5f5562.png"];
List<Color> cc=[Colors.black,Colors.green,Colors.deepOrange,Colors.blue,Colors.pink,Colors.orange,
Colors.cyan]; 

  bool visible = true;
  int j = 0,xx=0;
  double left = 0.0, top = 0.0;

  String x = "";
  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController controller = TextEditingController();
  String? headertext = "here the meme text will be displayed", footertext;
  File? file1;
  File? image;
  File? image5;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagetemp = File(image.path);
      print(image.path);
      setState(() {
        this.image = imagetemp;
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
    //print(image!.path);
  }
takesx(BuildContext context) async
{
// image5=  screenshotController.captureAsUiImage(pixelRatio: 1);
// screenshotController.capture().then((image5){});
}
  takescreenshot(BuildContext context) {
   
    screenshotController.capture().then((Uint8List? image) {
      savescreenshot(image!);
    });
  }

  savescreenshot(Uint8List bytes) async {
    final time = DateTime.now();
    final name = "screensht123";
    int fontsize = 10;
   var response= await ImageGallerySaver.saveImage(bytes, name:name);

 
   
   
/*
    Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Image saved to Gallery"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                  setState(() {
                    image5;
                  });*/
  }

  @override
  Widget build(BuildContext context) {
 
  List<TextStyle> q = [
    GoogleFonts.cedarvilleCursive(
    
      textStyle: TextStyle(

        fontStyle: FontStyle.italic,
          fontSize: fontsize1,
      color: real,
      )
    ),
    GoogleFonts.actor(
       textStyle: TextStyle(
          fontSize: fontsize1,
      color: real,
      )
    ),
    GoogleFonts.aboreto(
       textStyle: TextStyle(
          fontSize: fontsize1,
      color: real,
      )
    ),
    GoogleFonts.akshar(
       textStyle: TextStyle(
          fontSize: fontsize1,
      color: real,
      )
    )
  ];
    // TODO: implement build
    return MaterialApp(
      
     home:Scaffold(
      
        body: SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //  Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
          SizedBox(height: 50),
          //Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
          Container(
              height: 400,
              width: 500,
              child: Screenshot(
                  controller: screenshotController,
                  //          key:globalkey,
                  child: Stack(
                    children: [
                      //Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
                      image != null
                          ? Image.file(image!)
                          :h!=""?Image.network(h,height: 400,width:400):
                           Container(
                              height: 300,
                              child: Image.network(
                                  "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_auto,q_auto:best/rockcms/2022-01/210602-doge-meme-nft-mb-1715-8afb7e.jpg"),
                            ),
                      Align(
                          alignment: Alignment.center,
                          child: Visibility(
                            visible: visible,
                            child: TextButton(
                              child: Text("Click Here to Add Image"),
                              onPressed: () {
                                setState(() {
                                  visible = false;
                                });
                                pickImage(ImageSource.gallery);
                              },
                            ),
                          )),
                      SizedBox(height: 10),
                      Positioned(
                          left: left,
                          top: top,
                          //  padding: EdgeInsets.all(11),
                          child: GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  left = max(0, left + details.delta.dx);
                                  top = max(0, top + details.delta.dy);
                                });
                              },
                              onTap: () {},
                              child: Container(
                                color: Colors.white,
                                child: Text(
                                  "$headertext",
                                  style: q[j],
                                  textScaleFactor: fontsize1,
                                ),
                    
                              )))
                      //Text("bye",style: TextStyle(color:Colors.white),)
                    ],
                  )
                  )
                  ),
          SizedBox(
            height: 10,
          ),SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:GestureDetector(
              onTap: (){
                j=j+1;
                j=j%5;
                setState(() {
                  q[j];
                });
              },
            child: Row(children: [
              for(int i=0;i<5;i++)
              Container(height:100,
              width:150,
              child:Image.network(img[i]),
              )
            ]),
          ))
          ,
          SizedBox(height:10),
          SingleChildScrollView(
           scrollDirection: Axis.horizontal,
            child:
        Row(
          children: [
            for(int i=0;i<5;i++)
            GestureDetector(
              onTap: (){
                setState(() {
                  real=cc[i];
                  q;
                });
              },
            child:Container(
              height:100,
              width:100,
            color: cc[i],

            ))
          ],
        )
          
        ),
        Slider(
          label:"choose font size",
        value: _currentSliderValue,
      max: 12,
       // label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
            fontsize1=value;
          });}),
          
          TextField(
            maxLines: null,
          
            controller: controller,
            onChanged: (value) {
              setState(() {
                headertext = value;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "enter text of meme",
            ),
          ),
         
         Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
        
              ElevatedButton(
              onPressed: () {
                takescreenshot(context);
             
              },
              child: Text("Save to gallery")),
          ])
        ],
      ),
    )));
    

  }
}
