import 'package:cpu/SSTF/SSTF.dart';
import 'package:cpu/SSTF/model.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';



class SSTFOP extends StatelessWidget {

  List<dataschema> data;
  int totalTime;
  double avgTime;
   SSTFOP(this.data,this.totalTime,this.avgTime,{Key? key}) : super(key: key);

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
          Row(
            children: [
              Text('Total Time:'+totalTime.toString())
            ],
          ),
          Row(
            children: [
              Text('Avg. Time: '+avgTime.toString())
            ],
          )
          ],
        ),
      ),
    );
  }
}


