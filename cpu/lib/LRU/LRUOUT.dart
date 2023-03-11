import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LRUOUT extends StatelessWidget {
  int frame;
  ListQueue<int>Buffer;
   LRUOUT(this.frame,this.Buffer,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),

      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child:SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                      border: TableBorder.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid
                      ),
                      defaultColumnWidth: FixedColumnWidth(344/(frame+2)),
                     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                     
                      children: [
                        TableRow(
                          
                          children: [
                            Text('Data',textAlign: TextAlign.center,),
                            for(int i=1;i<=frame;i++) Text('Frame '+i.toString()),
                            Text('Result'),
                            
                            
                          ]
                        ),
                        for(int i=0;i<Buffer.length;i++)
                          TableRow(
                          
                          children: [
                            Text(Buffer.elementAt(i).toString(),textAlign: TextAlign.center,),
                            for(int i=1;i<=frame;i++) Text(' 2'),
                            Text('Hit'),
                            
                            
                          ]
                        ),
                        
                      ],
                    ),
                    ),
                    
                    
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text('Total Hit:'),
        ],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text('Total Miss:'),
        ],),
            )
          ],
        ),
        
        
      ),
      
    );
  }
}