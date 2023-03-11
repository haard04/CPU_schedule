import 'dart:collection';

import 'package:cpu/LRU/LRUOUT.dart';
import 'package:cpu/SRTN/viewiobt.dart';
import 'package:cpu/SSTF/model.dart';
import 'package:cpu/SSTF/output.dart';
import 'package:cpu/bounderBuffer/widget.dart';
import 'package:flutter/material.dart';

class LRU extends StatefulWidget {
  LRU({Key? key}) : super(key: key);

  @override
  State<LRU> createState() => _LRUState();
}

class _LRUState extends State<LRU> {

  int frame =0;
  ListQueue<int>Buffer=ListQueue();
  int x=0;
List<dataschema> d=[];

int totalTime=0;
double avgTime=0;




  
  
  void calculate(){
    setState(() {
      for(int i=0;i<Buffer.length;i++){
    d.add(dataschema(Buffer.elementAt(i), i));}
    });
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Replacement Algorithm ',
        style:TextStyle(
          fontFamily: 'Pacifico', fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Least Recently Used',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Text(
                    'No of Frames:  ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      
                       onChanged: (value) {
                      setState(() {
                        frame = int.parse(value);
                        
                        
                     
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                hintText: 'No of Frames',
                
              ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  children: [
                    Text('Queue: '+Buffer.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Queue :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      
                       onChanged: (value) {
                        x=int.parse(value);
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                hintText: 'Queue value',
                
              ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:(){ setState(() {
                        if(x>-1){
                          print(frame);
                        Buffer.add(x);
                        print(Buffer);
                        }
                        else{
                          
                          showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                        content: Text('Please select Proper value'),
                         actions: [
                          
                           ElevatedButton(onPressed: (){
                             Navigator.of(context).pop();
                           },
                           child: Text('Ok'),
                           )
                        ]
                         );});}});},
                     child: Text('ADD')),


                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(onPressed: (() {
                         setState(() {
                          if(Buffer.length>0){
                            Buffer.removeLast();
                          }
                          else{
                            
                            showDialog(
                          context: context,
                          builder: (BuildContext context) {
                          return AlertDialog(
                          content: Text('Queue is Empty'),
                           actions: [
                            
                             ElevatedButton(onPressed: (){
                               Navigator.of(context).pop();
                             },
                             child: Text('Ok'),
                             )
                          ]
                           );});}});}
                       ), child: Text('POP')),
                     )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) =>  LRUOUT(frame,Buffer)));}, child:Text('Calculate'))
                ],
              ),
            )
            
          ],
        ),
      ),
   
    );
  }
}

