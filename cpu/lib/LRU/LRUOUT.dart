import 'dart:collection';

import 'package:cpu/SRTN/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LRUOUT extends StatelessWidget {
  int frame;
  ListQueue<int>Buffer;
  int pageFaults;
  int pageHits;
  List<List> data;
  List<String> result;

   LRUOUT(this.frame,this.Buffer,this.pageFaults,this.pageHits,this.data,this.result,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //  using data to create the chart for the same entries in LRU

    final List<ChartData> chartData = [
            ChartData('Hit', pageHits.toDouble()),
            
            ChartData('Miss', pageFaults.toDouble())
        ];

    return Scaffold(// appbar for 'Results'
      appBar: AppBar(
        title: Text('Results'),

      ),
      body: Container(
        child:SingleChildScrollView(//scroller enabled
          physics: const AlwaysScrollableScrollPhysics(),
             child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),   // Creating the output ina tabular form for entries.
                  child: Container(  // Seting up the parametetrs for the the table such as the width, height and text alignment for each cell.
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
                            for(int i=1;i<=frame;i++) Text('Frame '+i.toString(),textAlign: TextAlign.center,),
                            Text('Result',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            
                            
                            
                          ],
                        ),
                        for(int i=0;i<Buffer.length;i++)
                          TableRow(
                          
                          children: [
                            Text(Buffer.elementAt(i).toString(),textAlign: TextAlign.center,),
                            for(int j=0;j<frame;j++) 
                            (data[i].length>j)? Text(data[i][j].toString(),textAlign: TextAlign.center,style: TextStyle(backgroundColor: (Buffer.elementAt(i)==data[i][j])?Colors.yellow:Colors.white),):Text(' '),


                            Text(result[i],textAlign: TextAlign.center,style: TextStyle(
                               // adding 'Hit' and 'Miss' cours and to the table entry
                              color: (result[i]=='Hit')? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),)
                            
                            
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
              child: Row(children: [    //  counting no of 'Hits'
                Text('Total Hit:'+pageHits.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [     //  counting no of 'Miss'
                Text('Total Miss:'+pageFaults.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ],),
            ),


            SfCircularChart(     // Displaying the hit miss ratio in a visual pie chart representation 
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              title: ChartTitle(text:'Hit-Miss Ratio',textStyle: TextStyle(fontWeight: FontWeight.bold) ),
              series:  <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            dataLabelSettings: DataLabelSettings(isVisible: true)
                        )
                    ],
              
            )
          ],
        ),
     
        )
        
        
      ),
      
    );
  }
}
class ChartData {
      ChartData(this.x, this.y);
        final String x;
        final double y;
    }