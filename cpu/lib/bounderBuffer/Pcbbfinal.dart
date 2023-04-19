import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpu/About.dart';
import 'package:cpu/Home.dart';
import 'package:cpu/LRU/LRU.dart';
import 'package:cpu/SRTN/SRTN.dart';
import 'package:cpu/SSTF/SSTF.dart';
import 'package:cpu/bounderBuffer/PCBBINFO.dart';
import 'package:cpu/openai/chat_body.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProducerConsumerScreenMonitor extends StatefulWidget {
  @override
  _ProducerConsumerScreenMonitorState createState() => _ProducerConsumerScreenMonitorState();
}

class _ProducerConsumerScreenMonitorState extends State<ProducerConsumerScreenMonitor> {
  final List<int> buffer = [];
  bool producing = false;
  int counter=0;
  String _buffersize='';
  List<String> dataPCBB=[];

void saveData() async{
  try {
    // Get a reference to the Firestore collection named "srtn"
    CollectionReference srtnCollection = FirebaseFirestore.instance.collection('pcbb/');
    
    // Create a new document in the "srtn" collection and set its data
    await srtnCollection.add({
      'Data': dataPCBB.toString(),
      
    });
    
    print('Strings added to "srtn" collection in Firestore');
  } catch (e) {
    print('Error adding strings to "srtn" collection in Firestore: $e');
  }

  showDialog(       // dialogue box to show the saved entries of the produced and consumed item
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


}
 //Synchronized method to produce items
  void _produce() async {  
    producing = true;
    while (buffer.length >= int.parse(_buffersize)) {
      await Future.delayed(Duration(milliseconds: 500)); //waits if buffer is full till it is not emptied to desired size
    }
    buffer.add(counter);
     

    dataPCBB.add('Producer Produced '+counter.toString()); // saving the producer entries 
    counter++;
    setState(() {});
    producing = false;
  }
//Synchronized method to consume items
  void _consume() async {
    while (buffer.isEmpty) {
      await Future.delayed(Duration(milliseconds: 500)); //waits if buffer is empty till it is not filled to desired size
    }
    dataPCBB.add('Consumer consumed '+buffer.first.toString()); // saving the consumer entries
    buffer.removeAt(0);
    setState(() {});
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,     
          children: [
            SizedBox(height: 16),
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
                  Text('Buffer Size:',              //text style for user friendly interface
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Buffer: ${buffer.join(', ')}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: producing ? null : _produce,
                  child: Text('Produce'),     
                ),
                ElevatedButton(
                  onPressed: _consume,
                  child: Text('Consume'),    
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) => ProducerConsumerScreenMonitor()),
                              (route) => route.isFirst,
                              );}
                  
                  , child: Text('Reset')),
                  ElevatedButton(onPressed: (){
                    saveData();
                  
                  }, child: Text('Save')), 
                ],
              ),
            
            ),
          ],
          
        ),
      ),
    );
  }
}
