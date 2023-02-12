import 'package:flutter/material.dart';

class LRU extends StatefulWidget {
  LRU({Key? key}) : super(key: key);

  @override
  State<LRU> createState() => _LRUState();
}

class _LRUState extends State<LRU> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LRU',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),),
      body: Container(),
    );
  }
}