import 'dart:async';

import 'package:cpu/Home.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

 @override
  void initState() {
  super.initState();

   startTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration =  Duration(seconds: 2);
    return Timer(duration, route);
    }
    route() {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Home()
          )
        );
      
    }
  

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/algo.png"),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const Text(
              "Splash Screen",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
                ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}