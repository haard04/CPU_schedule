import 'package:flutter/material.dart';

class LRUIO extends StatefulWidget {
  LRUIO({Key? key}) : super(key: key);

  @override
  State<LRUIO> createState() => _LRUIOState();
}

class _LRUIOState extends State<LRUIO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LRU IO',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),),
      body: Container(),
    );
  }
}