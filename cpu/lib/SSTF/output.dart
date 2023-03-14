import 'dart:collection';

import 'package:cpu/SSTF/SSTF.dart';
import 'package:cpu/SSTF/model.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';



class SSTFOP extends StatelessWidget {

  List<dataschema> data;
  int totalTime;
  double avgTime;
  ListQueue Buffer;
  ListQueue calculatedBuffer;
   SSTFOP(this.data,this.totalTime,this.avgTime,this.calculatedBuffer,this.Buffer,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Output')),
      body: Container(
        child: Column(
          children: [
            SfCartesianChart(
            // Initialize category axis
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),

            series: <LineSeries<dataschema, int>>[
              LineSeries<dataschema, int>(
                // Bind data source
                dataSource:  
                  data

                ,
                xValueMapper: (dataschema data, _) => data.index,
                yValueMapper: (dataschema data, _) => data.value
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,40,20,20),
            child: Row(
              children: [
                Text('Total Time:'+totalTime.toString(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            child: Row(
              children: [
                Text('Avg. Time: '+avgTime.toString(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
                )
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}


