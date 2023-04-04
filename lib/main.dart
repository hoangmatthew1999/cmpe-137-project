import 'package:flutter/material.dart';

void main() => runApp
(
  MaterialApp(
    home: Home()
    
    ));
class Home extends StatelessWidget{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(appBar: AppBar(
      title: Text("CMPE 137 Project 1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Click to play")), 
        ),
      );
  }
}



