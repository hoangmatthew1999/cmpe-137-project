import 'package:flutter/material.dart';

void main() => runApp
(
  MaterialApp(
    home: Scaffold(appBar: AppBar(
      title: Text("CMPE 137 Project 1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Click to play")), 
        ),
      )
    )
);


