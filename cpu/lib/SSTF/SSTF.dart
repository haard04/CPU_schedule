import 'dart:collection';
//  d.add(dataschema(Buffer.elementAt(i), i));
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpu/About.dart';
import 'package:cpu/Home.dart';
import 'package:cpu/LRU/LRU.dart';
import 'package:cpu/SRTN/SRTN.dart';
import 'package:cpu/SRTN/viewiobt.dart';
import 'package:cpu/SSTF/SSTFINFO.dart';
import 'package:cpu/SSTF/model.dart';
import 'package:cpu/SSTF/output.dart';
import 'package:cpu/bounderBuffer/PCBB.dart';
import 'package:cpu/bounderBuffer/widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SSTF extends StatefulWidget {
  SSTF({Key? key}) : super(key: key);

  @override
  State<SSTF> createState() => _SSTFState();
 
}

class _SSTFState extends State<SSTF> {
  @override

   final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }


  int size =0;
  int head =0;
  ListQueue<int>Buffer=ListQueue();
  ListQueue<int> calculatedBuffer =ListQueue();
  List<int> inputQueue=[];
  
  int x=0;
List<dataschema> d=[];

int totalTime=0;
double avgTime=0;
ListQueue<int> finalQueue=ListQueue();



void saveData() async {
  try {
    // Get a reference to the Firestore collection named "srtn"
    CollectionReference srtnCollection = FirebaseFirestore.instance.collection('sstf/');
    
    // Create a new document in the "srtn" collection and set its data
    await srtnCollection.add({
      'Size': size,
      'Head':finalQueue.first,
      'Queue': inputQueue.toString(),
      'Calculated Queue':finalQueue.toString(),
      'Total Time': totalTime,
      'Avg Time':avgTime
      
    });
    
    print('Strings added to "srtn" collection in Firestore');
  } catch (e) {
    print('Error adding strings to "srtn" collection in Firestore: $e');
  }
}







  
  
  void calculate(){
    setState(() {
      
      finalQueue.add(head);
      int counter=0;
      d.add(dataschema(head,counter));
      counter++;
      
      calculatedBuffer=Buffer;
      inputQueue=Buffer.toList();
      int l=Buffer.length;
      int  min,x; 
      while((calculatedBuffer.isNotEmpty)){
        min = (head-calculatedBuffer.elementAt(0)).abs(); x=0;
        for(int i=0; i<calculatedBuffer.length; i++){
            if((head-calculatedBuffer.elementAt(i)).abs()<min){
              
                min=(head-calculatedBuffer.elementAt(i)).abs(); x=i;
            }
        }
        totalTime+=min; head=calculatedBuffer.elementAt(x);
        print(x);
        print(totalTime);
        d.add(dataschema(calculatedBuffer.elementAt(x),counter));
        counter++;
        finalQueue.add(calculatedBuffer.elementAt(x));
        calculatedBuffer.remove(calculatedBuffer.elementAt(x));
        
    }
    avgTime=totalTime/l;
    
    });
    print(d);
    print('inputQueue'+inputQueue.toString());
    print('Cal Buffer'+calculatedBuffer.toString());
    print('Buffer'+Buffer.toString());
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disk Scheduling Algorithm',
        style:TextStyle(
          fontFamily: 'Pacifico', fontWeight: FontWeight.bold
          ),
        ),
        actions: <Widget>[
          Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (conText) => SSTFINFO()),);
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
                  Text('Shortest Seek Time First',
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
                    'Size:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      
                       onChanged: (value) {
                      setState(() {
                        size = int.parse(value);
                        
                        
                     
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                hintText: 'Total Size',
                
              ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Head :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      
                       onChanged: (value) {
                      setState(() {
                        if(int.parse(value)<size){
                          print(size);
                        head = int.parse(value);}
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
                        }
                        
                        
                     
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                hintText: 'Head value',
                
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
                    controller: fieldText,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                hintText: 'Queue value',
                
              ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:(){ setState(() {
                        if(x<size&&x>-1){
                          print(size);
                        Buffer.add(x);
                        clearText();
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
                            clearText();
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
                  ElevatedButton(onPressed:(){
                   
                    calculate(); 
                                      saveData();
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>  SSTFOP(d,totalTime,avgTime,calculatedBuffer,Buffer)),(route)=>route.isFirst);
                 }, 
                  child:Text('Calculate'))
                ],
              ),
            )
            
          ],
        ),
      ),
   
    );
  }
}

