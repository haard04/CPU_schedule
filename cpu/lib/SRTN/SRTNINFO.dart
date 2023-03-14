import 'package:cpu/SRTN/view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SRTNINFO extends StatelessWidget {
  const SRTNINFO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPU Scheduling Algorithm'),

      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('CPU Scheduling',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text('CPU scheduling is the task performed by the CPU that decides the way and order in which processes should be executed. There are two types of CPU scheduling - Pre-emptive, and non-pre-emptive. The criteria the CPU takes into consideration while "scheduling" these processes are - CPU utilization, throughput, turnaround time, waiting time, and response time.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      
                    ),
                    ),
                  )
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('SRTN',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Shortest remaining Time Next scheduling algorithm is also referred as preemptive SJF scheduling algorithm. When a new process arrives at ready queue while one process is still executing then SRTN algorithm is performed to decide which process will execute next. This algorithm compare CPU burst time of newly arrived process with remaining (left) CPU burst time of currently executing process. If CPU burst time of new process is less than remaining time of current process then SRTN algorithm preempts current process execution and starts executing new process. ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      
                    ),
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