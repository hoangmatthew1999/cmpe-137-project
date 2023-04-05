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
      body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 3,
  // Generate 100 widgets that display their index in the List.
  children: List.generate(9, (index) {
    return Center(
      child: ElevatedButton(onPressed: () {print(index);}, child: Text("Click to add position ")),
    );
  }),
),
      );
  }
}



