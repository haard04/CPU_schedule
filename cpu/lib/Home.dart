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
      appBar: AppBar(title:Text('CPU Scheduling App'),),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('Welcome to CPU scheduling App')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: null, child: Text('Step 1')),
                ElevatedButton(onPressed: null, child: Text('Step 2')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: null, child: Text('Step 3')),
                ElevatedButton(onPressed: null, child: Text('Step 4')),
              ],
            ),

          ],
        ),
      ),

    );
  }
}