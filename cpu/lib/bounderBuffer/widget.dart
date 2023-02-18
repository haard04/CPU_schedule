import 'dart:math';

import 'package:flutter/material.dart';

class Wid extends StatelessWidget {
  int? id;
  int? i;
   Wid({this.i,this.id,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  
                  child: Text(i.toString()+': Product '+id.toString(),textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),selectionColor: Colors.blue),decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.purple),
                height: 40,
                width: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}