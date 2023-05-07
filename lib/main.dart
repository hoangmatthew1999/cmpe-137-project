import 'package:flutter/material.dart';
import 'dart:async';

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
      child: ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidget()) );}, child: Text("Click to add position ")),
    );
  }),
),
      );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String x_or_o = "";
  List<String> x_or_o_Array = ["", "","","","","","","","",];
  bool myTurn = true;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(appBar: AppBar(title: Text("CMPE 137 Project 1"),),
      body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 3,
  // Generate 100 widgets that display their index in the List.

  //child: ElevatedButton(onPressed: () {buttonPress_();}, child: Text("Click to add position "));
  // return Center(child: Text(x_or_o),);
  children: List.generate(9, (int index) {
      // 
      return GestureDetector(
        onTap: () {buttonPress_(index);},
        child: Container
        (decoration: BoxDecoration  (border: Border.all(color: Colors.grey)),
          child: Center( child: Text (x_or_o_Array[index]),
        )  ),
      );
  }),
),
      );
  }

  void buttonPress_(int index)
  { 
    if(myTurn == true){setState (() {x_or_o_Array[index] = "o";} );}
    else{setState (() {x_or_o_Array[index] = "x";} );}
    myTurn = !myTurn;
    checkWin();
  }
  void checkWin()
  {
    if(x_or_o_Array[0] == x_or_o_Array[1] && x_or_o_Array[1] == x_or_o_Array[2]){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );}
    else if(x_or_o_Array[3] == x_or_o_Array[4] && x_or_o_Array[4] == x_or_o_Array[5]){print("second row");}

  }



}
class ColorFillGame extends StatefulWidget {
  @override
  _ColorFillGameState createState() => _ColorFillGameState();
}

class _ColorFillGameState extends State<ColorFillGame> 
{
  Timer? _timer;
  int _timeElapsed = 0;
  int _clickCount = 0;
  double _progress = 0.0;
  void _startTimer()
  {
     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeElapsed++;
        _progress = _clickCount / 100.0;
      });
    });
  }
  void _handleButtonClick()
  {
     setState(() {
      _clickCount++;
      _progress = _clickCount / 100.0;
      if (_clickCount == 100) {
        _stopTimer();
      }
    });
  }
  void _stopTimer(){ _timer?.cancel();}

    @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }


   @override
                Widget build(BuildContext context) 
                {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('Color Fill Game'),
                    ),   body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.blue.withOpacity(_progress),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text('Start Game'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleButtonClick,
              child: Text('Fill Screen'),
            ),
            SizedBox(height: 20),
            Text('Time elapsed: $_timeElapsed seconds'),
            SizedBox(height: 10),
            Text('Score: $_timeElapsed'),
          ],
        ),
      ),);
                }

}







