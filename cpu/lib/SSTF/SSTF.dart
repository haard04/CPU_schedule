import 'dart:collection';
//  d.add(dataschema(Buffer.elementAt(i), i));
import 'package:cpu/SRTN/viewiobt.dart';
import 'package:cpu/SSTF/SSTFINFO.dart';
import 'package:cpu/SSTF/model.dart';
import 'package:cpu/SSTF/output.dart';
import 'package:cpu/bounderBuffer/widget.dart';
import 'package:flutter/material.dart';

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
  
  int x=0;
List<dataschema> d=[];

int totalTime=0;
double avgTime=0;










  
  
  void calculate(){
    setState(() {
      int counter=0;
      d.add(dataschema(head,counter));
      counter++;
      
      calculatedBuffer=Buffer;
      
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
        calculatedBuffer.remove(calculatedBuffer.elementAt(x));
        
    }
    avgTime=totalTime/l;
    
    });
    print(d);
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shortest Seek Time First',
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
      body: Container(
        child: Column(
          children: [
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
                  ElevatedButton(onPressed:(){calculate(); 
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>  SSTFOP(d,totalTime,avgTime,calculatedBuffer,Buffer)),(route)=>route.isFirst);}, 
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

