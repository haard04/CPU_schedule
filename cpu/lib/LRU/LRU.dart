/*  LRU(Least Recently Used Paging Algorithm)  */

/* Importing required packages for the same  */
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
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
List<List> data=[];
 int pageFaults = 0;
  int pageHits =0;
  List<String> result=[];
 // String given='';
  List<String> givenstr=[];

int totalTime=0;
double avgTime=0;

List<int>inputQueue=[];

/* 
"calculateLRU()" : function for calculating wheather the given data in queue 
                    is a 'HIT' or 'MISS'.    

                 ->'HIT' occurs when a process requests a page that is already
                  present in the main memory. 
                  ->'MISS' occurs when a process requests a page that is not 
                  present in the main memory .                     
 */
void calculateLRU(ListQueue<int> Buffer, int frameCount) {
  inputQueue=Buffer.toList();
  Queue<int> answer = Queue();
 

  for (int page in Buffer) {
// Checking if the page is already in the buffer.
    if (answer.contains(page)) { 
      answer.remove(page);
      answer.addLast(page);
      
      data.add(answer.toList());
      print(answer);
      pageHits++;
      result.add('Hit');
    } else {
   // If the buffer is full, remove the least recently used page.   
      if (answer.length == frameCount) { 
        answer.removeFirst();
      }
      answer.addLast(page);
      
      data.add(answer.toList());
      print(answer);
      pageFaults++;
      result.add('Miss');
    }
  }

  print("Page Faults: $pageFaults");   //  page MISS
  print("Page Hits: $pageHits");      // page HIT
  print(data);
  print(Buffer.length);
}

  
  /* 
    "saveData()" : connecting the app data to the main database. here we have
                   used 'CLOUD FIREBASE'.

                   ->The data is saved in JSON (JavaScript Object Notation).
                   ->DATA Format :{    'Frames': (string format),     
                                       'Queue': (string format),     
                                       'Result Data': (string format),    
                                       'Result': (string format),     
                                       'TotalHIts': (string format),   
                                       'Total Miss': (string format)    }
  */
  void saveData() async {
    try {
    
    CollectionReference srtnCollection = FirebaseFirestore.instance.collection('lru/');
    
   
    await srtnCollection.add({
      'Frames': frame.toString(),
      'Queue': inputQueue.toString(),
      'Result Data':data.toString(),
      'Result':result.toString(),
      'Total Hits':pageHits,
      'Total Miss':pageFaults
    });
    
    print('Strings added to "LRU" collection in Firestore');
  } catch (e) {
    print('Error adding strings to "LRU" collection in Firestore: $e');
  }
  }


  @override
  final fieldText = TextEditingController();
  void clearText() {// Function to clear text
    fieldText.clear();
  }

  final frameText = TextEditingController();
  void clearFrame() {// Function to clear text
    frameText.clear();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Function for app bar
        title: Text('Page Replacement Algorithm ', 
        style:TextStyle(
          fontFamily: 'Pacifico', fontWeight: FontWeight.bold
          ),
        ),


 
        actions: <Widget>[     // navigates to the 'info' page
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
     
     // side drawer for redirecting to other algorithms and the home page
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
                      controller: frameText,
                      
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
                    Expanded(child: Text('Queue: '+Buffer.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
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
                       //given=value;
                        
                    },
                    controller: fieldText,
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
                        // print(Buffer);
                        clearText();
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
                         );});
                         }});
                         },
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   (frame>0)?
                  ElevatedButton(
                   
                  onPressed:()
                  
                  {
                    // givenstr=given.split(',');
                    // for(int i=0;i<givenstr.length;i++){
                    //   Buffer.add(int.parse(givenstr[i]));
                    // }
                      calculateLRU(Buffer, frame);
                      saveData(); 
                      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>  LRUOUT(frame,Buffer,pageFaults,pageHits,data,result)),(route)=>route.isActive);
                      },
                      
                      child:Text('Calculate'))
                      :Text(''),

                      ElevatedButton(onPressed:(){
                        setState(() {
                          frame =0;
                         Buffer.clear();
                         clearFrame();

                            x=0;
                          data=[];
                            pageFaults = 0;
                            pageHits =0;
                            result=[];
                          // String given='';
                            givenstr=[];

                          totalTime=0;
                          avgTime=0;

                          inputQueue=[];
                        });
                         

                        }, 
                        child: Text('Reset'))
                ],
              ),
            )
            
          ],
        ),
      ),
   
    );
  }
}