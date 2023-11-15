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
//import 'package:native_screenshot_ext/native_screenshot_ext.dart';
import 'package:screenshot/screenshot.dart';
import 'package:text_editor/text_editor.dart';

class homepage extends StatefulWidget {
  @override
  homepage1 createState() {
    return homepage1();
  }
}

class homepage1 extends State<homepage> {
  double fontsize1 = 10;
  List<TextStyle> q = [
    GoogleFonts.aBeeZee(),
    GoogleFonts.actor(),
    GoogleFonts.aboreto(),
    GoogleFonts.akshar()
  ];
  bool visible = true;
  int j = 0;
  double left = 0.0, top = 0.0;

  String x = "";
  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController controller = TextEditingController();
  String? headertext = "here the meme text will be displayed", footertext;
  File? file1;
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagetemp = File(image.path);
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
  }

  takescreenshot(BuildContext context) {
    screenshotController.capture().then((Uint8List? image) {
      savescreenshot(image!);
    });
  }

  savescreenshot(Uint8List bytes) async {
    final time = DateTime.now();
    final name = "screensht";
    int fontsize = 10;
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //  Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
          SizedBox(height: 50),
          //Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
          Container(
              height: 500,
              width: 500,
              child: Screenshot(
                  controller: screenshotController,
                  //          key:globalkey,
                  child: Stack(
                    children: [
                      //Image.network("https://images.pexels.com/photos/15286/pexels-photo.jpg"),
                      image != null
                          ? Image.file(image!)
                          : Container(
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
                                color: Colors.green,
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
          ElevatedButton(
              onPressed: () {
                setState(() {
                  j = (j + 1);
                  int k = q.length;
                  j = j % k;
                  q[j];
                });
              },
              child: Text("change font style")),
          TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                headertext = value;
              });
            },
            decoration: InputDecoration(
              hintText: "enter upper text",
            ),
          ),
          SizedBox(height: 10),
          TextField(
            //     controller: controller,
            onChanged: (value) {
              setState(() {
                fontsize1 = double.parse(value);
              });
            },
            decoration: InputDecoration(
              hintText: "enter font size",
            ),
          ),
          SizedBox(
            height: 10,
          ),

          ElevatedButton(
              onPressed: () {
                takescreenshot(context);
              },
              child: Text("Save"))
        ],
      ),
    ));
  }
}
