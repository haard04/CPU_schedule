import 'package:cpu/Home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main(){

  runApp(MaterialApp(title: 'CPU Simulator',home: MyApp(),) );
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
    return
       MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.purple,
      ),
      home:  Home(),
    );
  });}}
    
    


