import 'dart:collection';
import 'dart:math';

import 'package:cpu/About.dart';
import 'package:cpu/Home.dart';
import 'package:cpu/LRU/LRU.dart';
import 'package:cpu/SRTN/SRTN.dart';
import 'package:cpu/SSTF/SSTF.dart';
import 'package:cpu/bounderBuffer/PCBBINFO.dart';
import 'package:cpu/bounderBuffer/Pcbbfinal.dart';
import 'package:cpu/bounderBuffer/widget.dart';
import 'package:cpu/openai/chat_body.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
  List<String> dataPCBB=[];
  bool producing = false;


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
    dataPCBB=[];
    
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) => ProducerConsumerScreenMonitor()),
                              (route) => route.isFirst,
                              );
                      
                    });
    
  }

 
  void _consume() async {
    while (Buffer.isEmpty) {
      await Future.delayed(Duration(milliseconds: 500));
    }
    Buffer.remove(0);
    setState(() {});
  }

  void _produce() async {
    producing = true;
    while (Buffer.length >= 5) {
      await Future.delayed(Duration(milliseconds: 500));
    }
    Buffer.add(DateTime.now().millisecondsSinceEpoch);
    setState(() {});
    producing = false;
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
          Navigator.push(context,MaterialPageRoute(builder: (conText) => ChatPage()),);
        },
        child: Icon(
            Icons.help
        ),
      )
    ),
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
      drawer: Drawer(
        width: 60.w,
          child: ListView(


            children: [
              Padding(
                padding:EdgeInsets.all(10),
                child: SizedBox(
                  height: 8.h,
                  child: const DrawerHeader(
                    
                    child: Text('CPU Simulator',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          //sizer
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.purple,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  children: [
                    GestureDetector(child:SizedBox(
                      
                      // height: 10.h,
                      width: 55.w,
                      
                      child: Text('Home', 
                      textAlign: TextAlign.center,
                      
                      
                      style: TextStyle(
                     
                        
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )),onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context) =>  Home()),);},)
                  ],
                ),
              ),
              Divider(thickness: 1,color: Colors.purple,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  children: [
                    GestureDetector(child:SizedBox(
                      
                      // height: 10.h,
                      width: 55.w,
                      
                      child: Text('SRTN', 
                      textAlign: TextAlign.center,
                      
                      
                      style: TextStyle(
                     
                        
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )),onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context) =>  SRTN()),);},)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  children: [
                    GestureDetector(child:SizedBox(
                      
                      // height: 10.h,
                      width: 55.w,
                      
                      child: Text('PCBB', 
                      textAlign: TextAlign.center,
                      
                      
                      style: TextStyle(
                     
                        
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )),onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context) =>  ProducerConsumerScreenMonitor()),);},)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  children: [
                    GestureDetector(child:SizedBox(
                      
                      // height: 10.h,
                      width: 55.w,
                      
                      child: Text('SSTF', 
                      textAlign: TextAlign.center,
                      
                      
                      style: TextStyle(
                     
                        
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )),onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context) =>  SSTF()),);},)
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  children: [
                    GestureDetector(child:SizedBox(
                      
                      // height: 10.h,
                      width: 55.w,
                      
                      child: Text('LRU', 
                      textAlign: TextAlign.center,
                      
                      
                      style: TextStyle(
                     
                        
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )),onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context) =>  LRU()),);},)
                  ],
                ),
              ),
              Divider(thickness: 1,color: Colors.purple,),
              Padding(padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
              child:Divider(thickness: 1,color: Colors.purple,),),
             
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                child: Row(
                  
                  children: [
                    
                    GestureDetector(child:SizedBox(
                      
                      // height: 10.h,
                      width: 55.w,
                      
                      child: Text('About', 
                      textAlign: TextAlign.center,
                      
                      
                      style: TextStyle(
                     
                        
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )),onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context) =>  aboutPage()),);},),
                    
                  ],
                ),
                
              ),
              Divider(thickness: 1,color: Colors.purple,)
      ])),
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
              //     Expanded(
              //   child: TextField(
              //     onChanged: (value) {
              //       setState(() {
              //         _producerweight = value;
                      
              //       });
              //     },
              //     keyboardType: TextInputType.numberWithOptions(),
              //     decoration: InputDecoration(
              //   hintText: 'Producer Weight',
              // ),
              //   ),
              // ),
              SizedBox(width: 16.0),
              ElevatedButton(onPressed: producing ? null : _produce, child: Text('Producer'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
              //     Expanded(
              //   child: TextField(
              //     onChanged: (value) {
              //       setState(() {
              //         _consumerweight = value;
              //       });
              //     },
              //     keyboardType: TextInputType.numberWithOptions(),
              //     decoration: InputDecoration(
              //   hintText: 'consumer weight',
              // ),
              //   ),
              // ),
              SizedBox(width: 16.0),
              ElevatedButton(onPressed: _consume, child: Text('Consumer'))
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: reset, child: Text('Reset')),
                  ElevatedButton(onPressed: (){
                    print(dataPCBB);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                        content:   Text(dataPCBB.toString()),
                         actions: [
                          
                           TextButton(onPressed: (){
                             Navigator.of(context).pop();
                           },
                           child: Text('Ok'),
                           )
                        ]
                         );});
                  
                  
                  
                  
                  }, child: Text('Save')),
                ],
              ),
            
            ),
            Row(children: [Expanded(child: Text(Buffer.toString()))],)
                
               // for(int i=0;i<Buffer.length;i++) Wid(id: Buffer.elementAt(i),i: i,)
              
          ],
        ),
      ),
    ));
  }
}