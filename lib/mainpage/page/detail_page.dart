import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:memeapp/Modal%20class/imagemodal.dart';
import 'package:screenshot/screenshot.dart';

import '../model/food.dart';

String a = "", b = "", c = "";

class DetailPage extends StatefulWidget {
  DetailPage({name, img, description}) {
    a = name;
    b = img;
    c = description;
  }
  @override
  _DetailPageState createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  ScreenshotController controller = ScreenshotController();
  int quantity = 1;
  takescreenshot(BuildContext context) {
    controller.capture().then((Uint8List? image) {
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
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          const SizedBox(height: 20),
          header(),
          const SizedBox(height: 20),
          Screenshot(child: image(), controller: controller),
          details(),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                AlertDialog(
                  content: Text("Image saved to gallery"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("O.K"))
                  ],
                );
                takescreenshot(context);
              },
              child: Text("save to gallery"))
        ],
      ),
    );
  }

  Container details() {
    return Container(
      color: const Color.fromARGB(255, 69, 69, 69),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   widget.food.name,
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black,
                    //     fontSize: 34,
                    //   ),
                    // ),
                    // Text('\$${widget.food.price}',
                    //     style: const TextStyle(
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.green,
                    //     )),
                  ],
                ),
              ),
              // Material(
              //   color: Colors.green,
              //   // borderRadius: BorderRadius.circular(30),
              //   child: Row(
              //     children: [],
              //   ),
              // ),
            ],
          ),
          // const SizedBox(height: 30),
          // Row(
          //   children: [
          //     const Icon(Icons.star, color: Colors.amber),
          //     const SizedBox(width: 4),
          // Text(
          //   widget.food.rate.toString(),
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const Spacer(),
          // const Icon(Icons.fiber_manual_record, color: Colors.red),
          // const SizedBox(width: 4),
          // Text(
          //   '${widget.food.kcal} kcal',
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const Spacer(),
          // const Icon(Icons.access_time_filled, color: Colors.amber),
          // const SizedBox(width: 4),
          // Text(
          //   widget.food.cookingTime,
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          //   ],
          // ),
          const SizedBox(height: 30),
          Text(
            'Description',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            c,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          // const SizedBox(height: 30),
          // Material(
          //   // color: Colors.green,
          //   // borderRadius: BorderRadius.circular(16),
          //   child: InkWell(
          //     borderRadius: BorderRadius.circular(16),
          //     onTap: () {},
          //     child: Container(
          //       width: double.infinity,
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 20,
          //       ),
          //       // child: const Text(
          //       //   'Add to Cart',
          //       //   textAlign: TextAlign.center,
          //       //   style: TextStyle(
          //       //     fontSize: 18,
          //       //     color: Colors.white,
          //       //   ),
          //       // ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  SizedBox image() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 52, 52, 52),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[300]!,
                    blurRadius: 16,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(250),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  b,
                  fit: BoxFit.cover,
                  width: 400,
                  height: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          // Material(
          //   color: Colors.white.withOpacity(0.3),
          //   borderRadius: BorderRadius.circular(8),
          //   child: const BackButton(color: Colors.white),
          // ),
          const Spacer(),
          Text(
            '',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
          const Spacer(),
          // Material(
          //   color: Colors.white.withOpacity(0.3),
          //   borderRadius: BorderRadius.circular(8),
          //   child: InkWell(
          //     onTap: () {},
          //     borderRadius: BorderRadius.circular(8),
          //     child: Container(
          //       height: 40,
          //       width: 40,
          //       alignment: Alignment.center,
          //       child: const Icon(Icons.favorite_border, color: Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
