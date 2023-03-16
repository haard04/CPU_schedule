import 'dart:async';

import 'package:flutter/material.dart';

class ProducerConsumerScreenMonitor extends StatefulWidget {
  @override
  _ProducerConsumerScreenMonitorState createState() => _ProducerConsumerScreenMonitorState();
}

class _ProducerConsumerScreenMonitorState extends State<ProducerConsumerScreenMonitor> {
  final List<int> buffer = [];
  bool producing = false;
  int counter=0;

  void _produce() async {
    producing = true;
    while (buffer.length >= 5) {
      await Future.delayed(Duration(milliseconds: 500));
    }
    buffer.add(counter);
    counter++;
    setState(() {});
    producing = false;
  }

  void _consume() async {
    while (buffer.isEmpty) {
      await Future.delayed(Duration(milliseconds: 500));
    }
    buffer.removeAt(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producer-Consumer'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Buffer: ${buffer.join(', ')}'),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: producing ? null : _produce,
                child: Text('Produce'),
              ),
              ElevatedButton(
                onPressed: _consume,
                child: Text('Consume'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
