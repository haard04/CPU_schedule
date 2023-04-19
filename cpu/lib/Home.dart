import 'package:cpu/About.dart';
import 'package:cpu/LRU/LRU.dart';
import 'package:cpu/bounderBuffer/PCBB.dart';
import 'package:cpu/SRTN/SRTN.dart';
import 'package:cpu/SSTF/SSTF.dart';
import 'package:cpu/bounderBuffer/Pcbbfinal.dart';
import 'package:cpu/openai/chat_body.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:Text('CPU Simulator'),
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
        child:GridView.count(
             
          crossAxisCount: 2,
          children: [
            InkWell(
          splashColor: Colors.black26,
          onTap: () 
            {Navigator.push(context,MaterialPageRoute(builder: (context) =>  SRTN()),);},
             child:Column(
                children: [
                      Ink.image(
                image: AssetImage('assets/1.png'),
              height: 18.h,
              width: 40.w, 
              fit: BoxFit.fitWidth,
              ),
                      SizedBox(height: 4,width: 40,),
                      Text(
                'CPU Scheduling ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  
                  color: Colors.black
                ),
              
              ),

                    ],
             )
                ),
            InkWell(
          splashColor: Colors.black26,
          onTap: () 
            {Navigator.push(context,MaterialPageRoute(builder: (context) =>  ProducerConsumerScreenMonitor()),);},
             child:Column(
                children: [
                      Ink.image(
                image: AssetImage('assets/2.png'),
              height: 18.h,
              width: 40.w, 
              fit: BoxFit.fitWidth,
              ),
              
              SizedBox(height: 4,width: 40,),
              Text(
                'Deadlock ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  
                  color: Colors.black
                ),
              
              ),
              
              ])
             ),
             
            InkWell(
                splashColor: Colors.black26,
                onTap: ()
                {Navigator.push(context,MaterialPageRoute(builder: (context) =>  SSTF()),);},
                child:Column(
                  children: [
                    Ink.image(
                      image: AssetImage('assets/3.png'),
                      height: 18.h,
                      width: 40.w,
                      fit: BoxFit.fitWidth,
                    ),

                    SizedBox(height: 4,width: 40,),
                    Text(
                      'Disc Scheduling',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20.sp,

                          color: Colors.black
                      ),

                    ),
                  ],
                )
            ),
            InkWell(
                splashColor: Colors.black26,
                onTap: ()
                {Navigator.push(context,MaterialPageRoute(builder: (context) =>  LRU()),);},
                child:Column(
                  children: [
                    Ink.image(
                      image: AssetImage('assets/4.png'),
                      height: 18.h,
                      width: 40.w,
                      fit: BoxFit.fitWidth,
                    ),

                    SizedBox(height: 4,width: 40,),
                    Text(
                      'Page Replacement ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.sp,

                          color: Colors.black
                      ),

                    ),
                  ],
                )
            ),
            





          ])
        ),
       );

    
  }
}