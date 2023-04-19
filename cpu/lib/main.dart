import 'package:cpu/Home.dart';
import 'package:cpu/landingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  await Firebase.initializeApp();
  runApp(MyApp(), );
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
       
        primarySwatch: Colors.purple ,
      ),
      home:    splashScreen(),
    );
  });}}
    
    


