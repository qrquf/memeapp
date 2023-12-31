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
import 'package:animated_text_kit/animated_text_kit.dart';

double fontsize1 = 7;
double _currentSliderValue = 10;
String h = "";
String email = "";
var real = Colors.black;

class homepage2 extends StatefulWidget {
  homepage2({iss, String em = ""}) {
    email = em;
    h = iss;
  }
  @override
  homepage1 createState() {
    return homepage1();
  }
}

class homepage1 extends State<homepage2> {
  @override
  void init() {
    super.initState();
  }

  List<String> img = [
    "https://d144mzi0q5mijx.cloudfront.net/img/C/E/Cedarville-Cursive.png",
    "https://www.cufonfonts.com/images/thumb/15868/actor-741x415-5840209885.jpg",
    "https://pbs.twimg.com/media/FdVP-RiWQAAWqdN.png:large",
    "https://www.cufonfonts.com/images/thumb/107308/akshar-741x415-7bef2e225b.jpg",
    "https://imgs.fontbrain.com/imgs/3a/d8/58f18d2ee7bf6afc4155b15ffb6f/pt-720x360-5f5562.png"
  ];
  List<Color> cc = [
    Colors.white,
    Colors.green,
    Colors.deepOrange,
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.cyan
  ];

  bool visible = true;
  //bool textvisible=false;
  //bool imagevisible=false;
  int j = 0, xx = 0;
  double left = 80.0, top = 40.0;
int _selectedindex=0;
  String x = "";
  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController controller = TextEditingController();
  String? headertext = "Text Space", footertext;
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

  takesx(BuildContext context) async {
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
    var response = await ImageGallerySaver.saveImage(bytes, name: name);


    Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Image saved to Gallery"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                  setState(() {
                    image5;
                  });
  }

  @override
  Widget build(BuildContext context) {
    List<TextStyle> q = [
      GoogleFonts.cedarvilleCursive(
          textStyle: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: fontsize1,
        color: real,
      )),
      GoogleFonts.actor(
          textStyle: TextStyle(
        fontSize: fontsize1,
        color: real,
      )),
      GoogleFonts.aboreto(
          textStyle: TextStyle(
        fontSize: fontsize1,
        color: real,
      )),
      GoogleFonts.akshar(
          textStyle: TextStyle(
        fontSize: fontsize1,
        color: real,
      ))
    ];
    void _onItemTapped(int index) {
  setState(() {
    _selectedindex = index;
    if(_selectedindex==0)
    {
     takescreenshot(context); 
    }
    if(_selectedindex==1)
    {
      pickImage(ImageSource.gallery);
    }
  });}
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:_selectedindex ,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          items: [
            
          BottomNavigationBarItem(icon: Icon(Icons.text_fields,
          ),
          
          label:"Save"),
          BottomNavigationBarItem(icon: Icon(Icons.image),
          label:"Add Image",
          
          
          )
        
          
        ]
        ),
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);

                  }),
                  
            ),
            body: 
            
            SingleChildScrollView(
        
             
              child:Container(
                 padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black,
                    Colors.purple
                  ])
                ),
              child: Column(
                children: [
                 // matedTextKit is a Stateful Widget that produces text animations. Include it in your build method like:

AnimatedTextKit(
  animatedTexts: [
    TypewriterAnimatedText(
      'Create Your Own meme',
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      speed: const Duration(milliseconds: 1000),
    ),
  ],
  
  totalRepeatCount: 4,
  pause: const Duration(milliseconds: 500),
  displayFullTextOnTap: true,
  stopPauseOnTap: true,
),
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
                                  ? Container(
                                    height:double.infinity,
                                    width:double.infinity,
                                    child:Image.file(image!,fit: BoxFit.fill,))
                                  : h != ""
                                      ? Image.network(h,
                                          height: 400, width: 400)
                                      : Container(
                                         // height: 300,
                                        
                                        ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Visibility(
                                    visible: visible,
                                    child: TextButton(
                                      child: Text("Click Here to Add Image",
                                      style: GoogleFonts.cedarvilleCursive(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      ),),
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
                                          left =
                                              max(0, left + details.delta.dx);
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
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  
                  TextFormField(
                    style: TextStyle(color:Colors.white),
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
                      hintStyle: TextStyle(
                        color: Colors.white
                      )
                    ),
                  ),
                  SizedBox(height:10),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GestureDetector(
                        onTap: () {
                          j = j + 1;
                          j = j % 5;
                          setState(() {
                            q[j];
                          });
                        },
                        child: Row(children: [
                          for (int i = 0; i < 5; i++)
                            Container(
                              padding: EdgeInsets.all(5),
                              child:
                            Container(
                             
                              height: 70,
                              width: 150,
                              child: Image.network(img[i],fit: BoxFit.fill,),
                            ))
                        ]),
                      )),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: 
                      Row(
                      
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              
                                onTap: () {
                                  setState(() {
                                    real = cc[i];
                                    q;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                               child:Container(
                                  decoration: BoxDecoration(
                                     color: cc[i],
                                    borderRadius: BorderRadius.all(Radius.circular(70))
                                  ),
                                  
                                  height: 100,
                                  width: 100,
                                 
                                ))),
                                
                        ],
                      )),
                  Slider(
                      label: "choose font size",
                      value: _currentSliderValue,
                      max: 12,
                      // label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                          fontsize1 = value;
                        });
                      }),

                ],
              ),
            ))));
  }
}
