import 'dart:collection';
import 'dart:math';

import 'package:cpu/bounderBuffer/PCBBINFO.dart';
import 'package:cpu/bounderBuffer/widget.dart';
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
  ListQueue<int>Buffer=ListQueue();
  List<String>data=[];


  int counter=1;

  void reset(){
    setState(() {
                    counter=1;
    _buffersize='0';
    _producerweight='0';
    _consumerweight='0';  
    print(_buffersize);
    print(_producerweight);
    print(_consumerweight);
    Buffer.clear();
    print(Buffer);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) => PCBB()),
                              (route) => route.isFirst,
                              );
                      
                    });
    
  }

  void consumer(){
                setState(() {
                  // Update the value of the TextField.
                  for(int i=0;i<int.parse(_consumerweight);i++)
                  

                  try {
                    if(Buffer.length>0){
                    Buffer.removeLast();}
                    else {
                     // print("FULL");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                        content: Text('Buffer is Empty'),
                         actions: [
                          
                           TextButton(onPressed: (){
                             Navigator.of(context).pop();
                           },
                           child: Text('Ok'),
                           )
                        ]
                         );});
                         break;
                                }
                  } catch (e) {
                    print(e.toString());
                  }
                
                  print(_consumerweight);
                  });
              }

  void producer(){
                setState(() {
                  for(int i=0;i<int.parse(_producerweight);i++)
                  try{
                    if(Buffer.length<int.parse(_buffersize)){
                    Buffer.add(counter);counter++;}
                    else {
                     // print("FULL");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                        content: Text('Buffer is FULL!!'),
                         actions: [
                          
                           ElevatedButton(onPressed: (){
                             Navigator.of(context).pop();
                           },
                           child: Text('Ok'),
                           )
                        ]
                         );});
                         break;
                                }
                  }
                  catch(e){
                    print(e.toString());
                  }
                  
                
                  print(_producerweight);});
                }

  void save(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'PCBB',
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontWeight: FontWeight.bold
          ),
        ),
        actions: <Widget>[
          Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (conText) => PCBBINFO()),);
        },
        child: Icon(
            Icons.info_outline
        ),
      )
    ),
        ]
        
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('Producer Consumer Bounded Buffer Problem',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  )
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
                      _buffersize = value;
                      
                      
                   
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                hintText: 'Buffer size',
                
              ),
                ),
              ),
              
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
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                hintText: 'Producer Weight',
              ),
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(onPressed: producer, child: Text('Producer'))
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
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                hintText: 'consumer weight',
              ),
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(onPressed: consumer, child: Text('Consumer'))
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: reset, child: Text('Reset')),
                  ElevatedButton(onPressed: (){}, child: Text('Save')),
                ],
              ),
            
            ),
                
                for(int i=0;i<Buffer.length;i++) Wid(id: Buffer.elementAt(i),i: i,)
              
          ],
        ),
      ),
    ));
  }
}