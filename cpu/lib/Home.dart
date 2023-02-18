import 'package:cpu/LRU.dart';
import 'package:cpu/bounderBuffer/PCBB.dart';
import 'package:cpu/SRTN/SRTN.dart';
import 'package:cpu/SSTF.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'CPU Scheduling is a process of determining which process will own CPU for execution while another process is on hold. The main task of CPU scheduling is to make sure that whenever the CPU remains idle, the OS at least select one of the processes available in the ready queue for execution. The selection process will be carried out by the CPU scheduler. It selects one of the processes in memory that are ready for execution.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold
                      ),
                      )
                )
                  ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,50,20,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (conText) => SRTN()),);} ,
                    
                     child: Text('SRTN',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.red)
                      )
                     ),
                     fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(40),),
                     
                      ),
                      
                     ),

                     //PCBB
                  ElevatedButton(onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (conText) => PCBB()),);} ,
                    
                     child: Text('PCBB',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.red)
                      )
                     ),
                     fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(40),),
                      ),
                     ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //SSTF
                  ElevatedButton(onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (conText) => SSTF()),);} ,
                    
                     child: Text('SSTF',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.red)
                      )
                     ),
                     
                     fixedSize: MaterialStatePropertyAll<Size>(Size.fromWidth(80) ,),
                      ),
                     ),

                     //LRU
                  ElevatedButton(onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (conText) => LRU()),);} ,
                    
                     child: Text('LRU',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.red)
                      )
                     ),
                     fixedSize: MaterialStatePropertyAll<Size>(Size.fromWidth(80),),
                      ),
                     ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}