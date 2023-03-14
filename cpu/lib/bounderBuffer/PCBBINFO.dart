import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PCBBINFO extends StatelessWidget {
  const PCBBINFO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Synchronization & Deadlock'),

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
                  Text('Page Replacement',
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
                    child: Text('Page replacement algorithm decides which memory page is to be replaced. The process of replacement is sometimes called swap out or write to disk. Page replacement is done when the requested page is not found in the main memory (page fault). Frame allocation is all about how many frames are to be allocated to the process while the page replacement is all about determining the page number which needs to be replaced in order to make space for the requested page.',
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