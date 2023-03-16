import 'dart:collection';

import 'package:cpu/About.dart';
import 'package:cpu/Home.dart';
import 'package:cpu/LRU/LRUINFO.dart';
import 'package:cpu/LRU/LRUOUT.dart';
import 'package:cpu/SRTN/SRTN.dart';
import 'package:cpu/SRTN/viewiobt.dart';
import 'package:cpu/SSTF/SSTF.dart';
import 'package:cpu/SSTF/model.dart';
import 'package:cpu/SSTF/output.dart';
import 'package:cpu/bounderBuffer/PCBB.dart';
import 'package:cpu/bounderBuffer/widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class LRU extends StatefulWidget {
  LRU({Key? key}) : super(key: key);

  @override
  State<LRU> createState() => _LRUState();
}

class _LRUState extends State<LRU> {

  int frame =0;
  ListQueue<int>Buffer=ListQueue();
  int x=0;
List<Queue<dynamic>> data=[];

int totalTime=0;
double avgTime=0;


void calculateLRU(ListQueue<int> Buffer, int frameCount) {
  Queue<int> answer = Queue();
  int pageFaults = 0;
  int pageHits =0;

  for (int page in Buffer) {
    // Check if the page is already in the buffer
    if (answer.contains(page)) {
      answer.remove(page);
      answer.addLast(page);
      
      data.add(answer);
      print(answer);
      pageHits++;
    } else {
      // If the buffer is full, remove the least recently used page
      if (answer.length == frameCount) {
        answer.removeFirst();
      }
      answer.addLast(page);
      
      data.add(answer);
      print(answer);
      pageFaults++;
    }
  }

  print("Page Faults: $pageFaults");
  print("Page Hits: $pageHits");
  print(data);
}

  
  
  // void calculate(){
  //   setState(() {
  //     for(int i=0;i<Buffer.length;i++){
  //   d.add(dataschema(Buffer.elementAt(i), i));}
  //   });
    
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Replacement Algorithm ',
        style:TextStyle(
          fontFamily: 'Pacifico', fontWeight: FontWeight.bold
          ),
        ),

        actions: <Widget>[
          Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (conText) => LRUINFO()),);
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
              Divider(thickness: 3,color: Colors.purple,),

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
              Divider(thickness: 3,color: Colors.purple,),
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
                    )),onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context) =>  PCBB()),);},)
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
              Divider(thickness: 3,color: Colors.purple,),
              Padding(padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
              child:Divider(thickness: 3,color: Colors.purple,),),
             
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
              Divider(thickness: 3,color: Colors.purple,)
      ])),
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
                hintText: 'Value',
                
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
                  ElevatedButton(onPressed:(){ calculateLRU(Buffer, frame); Navigator.push(context,MaterialPageRoute(builder: (context) =>  LRUOUT(frame,Buffer)));}, child:Text('Calculate'))
                ],
              ),
            )
            
          ],
        ),
      ),
   
    );
  }
}

