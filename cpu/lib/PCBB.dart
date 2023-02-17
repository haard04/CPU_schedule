import 'package:cpu/SRTN/widget.dart';
import 'package:flutter/material.dart';

class PCBB extends StatefulWidget {
  PCBB({Key? key}) : super(key: key);

  @override
  State<PCBB> createState() => _PCBBState();
}

class _PCBBState extends State<PCBB> {

  String _buffersize='';
  String _producerweight='';
  String _consumerweight='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PCBB',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),),
      body: Container(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Text('Producer-Consumer Bounded Buffer Problem ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                child: TextField(
                  
                  onChanged: (value) {
                    setState(() {
                      _buffersize = value;
                      
                   
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                hintText: 'Enter value',
                
              ),
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(onPressed: (){
                setState(() {
                  // Update the value of the TextField.
                
                  print(_buffersize);
                  });
              }, child: Text('Buffer Size'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _producerweight = value;
                      
                    });
                  },
                  decoration: InputDecoration(
                hintText: 'Enter value',
              ),
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(onPressed: (){
                setState(() {
                  // Update the value of the TextField.
                
                  print(_producerweight);
                  });
              }, child: Text('Producer'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _consumerweight = value;
                    });
                  },
                  decoration: InputDecoration(
                hintText: 'Enter value',
              ),
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(onPressed: (){
                setState(() {
                  // Update the value of the TextField.
                
                  print(_consumerweight);
                  });
              }, child: Text('Consumer'))
                ],
              ),
            ),
                
               // for(int i=0;i<int.parse(_buffersize??'5');i++) Wid(id: i+1,i: i,)
              
          ],
        ),
      ),
    ));
  }
}