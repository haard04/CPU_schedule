import 'package:cpu/LRU/LRU.dart';
import 'package:cpu/bounderBuffer/PCBB.dart';
import 'package:cpu/SRTN/SRTN.dart';
import 'package:cpu/SSTF/SSTF.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// CPU Scheduling is a process of determining which process will own CPU for execution while another process is on hold. The main task of CPU scheduling is to make sure that whenever the CPU remains idle, the OS at least select one of the processes available in the ready queue for execution. The selection process will be carried out by the CPU scheduler. It selects one of the processes in memory that are ready for execution.'
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
      appBar: AppBar(title:Text('CPU Simulator'),),
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
                image: AssetImage('assets/CPU.jpeg'),
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
            {Navigator.push(context,MaterialPageRoute(builder: (context) =>  PCBB()),);},
             child:Column(
                children: [
                      Ink.image(
                image: AssetImage('assets/deadlock.png'),
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
                      image: AssetImage('assets/disc.png'),
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
                      image: AssetImage('assets/page.png'),
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