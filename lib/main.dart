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
          onPressed: () {Navigator.push( context, MaterialPageRoute(builder: (context) => FirstPage() )   );},
          child: Text("Click to play")), 
        ),
      );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(appBar: AppBar(
      title: Text("CMPE 137 Project 1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("On the second page ")), 
        ),
      );
  }
}



