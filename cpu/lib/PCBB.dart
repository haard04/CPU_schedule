import 'package:flutter/material.dart';

class PCBB extends StatefulWidget {
  PCBB({Key? key}) : super(key: key);

  @override
  State<PCBB> createState() => _PCBBState();
}

class _PCBBState extends State<PCBB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PCBB',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),),
      body: Container(),
    );
  }
}