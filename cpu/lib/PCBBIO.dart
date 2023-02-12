import 'package:flutter/material.dart';

class PCBBIO extends StatefulWidget {
  PCBBIO({Key? key}) : super(key: key);

  @override
  State<PCBBIO> createState() => _PCBBIOState();
}

class _PCBBIOState extends State<PCBBIO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PCBB IO',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),),
      body: Container(), 
    );
  }
}