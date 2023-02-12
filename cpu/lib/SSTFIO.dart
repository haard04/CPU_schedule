import 'package:flutter/material.dart';

class SSTFIO extends StatefulWidget {
  SSTFIO({Key? key}) : super(key: key);

  @override
  State<SSTFIO> createState() => _SSTFIOState();
}

class _SSTFIOState extends State<SSTFIO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SSTF IO',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),),
      body: Container(),
    );
  }
}