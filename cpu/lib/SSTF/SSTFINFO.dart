import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class SSTFINFO extends StatelessWidget {
  const SSTFINFO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disk Scheduling Algorithm'),

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
                  Text('Disk Scheduling',
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
                    child: Text('Disk Scheduling Algorithm is an algorithm that keeps and manages input and output requests arriving for the disk in a system. Disk scheduling is done by operating systems to schedule I/O requests arriving for the disk. Disk scheduling is also known as I/O scheduling. As we know, for executing any process memory is required. And when it comes to accessing things from a hard disk, the process becomes very slow as a hard disk is the slowest part of our computer. There are various methods by which the process can be scheduled and can be done efficiently.',
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
                  Text('SSTF',
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
                    child: Text('SSTF is a secondary storage scheduling algorithm that determines the motion of the disk’s head and arm in servicing the read and write requests. SSTF acts as a disk scheduling algorithm. It selects the requests with the least seek time starting from the current head position. Scheduling priority goes to the processes with the shortest seek- even if the requests aren’t the first ones in the queue. ',
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