import 'package:flutter/material.dart';
import 'package:memeapp/homepage.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatefulWidget{
  @override
MyApp createState() {
    return MyApp();
  }
}

class MyApp extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
home: homepage(),
    );
  }
 
}
hello guys
