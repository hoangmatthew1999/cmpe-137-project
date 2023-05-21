import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
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
          onPressed: () {Navigator.push( context, MaterialPageRoute(builder: (context) => MyWidget() )   );},
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
    if(x_or_o_Array[0] == x_or_o_Array[1] && x_or_o_Array[1] == x_or_o_Array[2] && x_or_o_Array[0] != '' && x_or_o_Array[1] != '' && x_or_o_Array[2] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//first row across
    if(x_or_o_Array[3] == x_or_o_Array[4] && x_or_o_Array[4] == x_or_o_Array[5] && x_or_o_Array[4] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//second row across
    if(x_or_o_Array[6] == x_or_o_Array[7] && x_or_o_Array[7] == x_or_o_Array[8] && x_or_o_Array[6] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//third row across 

    if(x_or_o_Array[0] == x_or_o_Array[4] && x_or_o_Array[4] == x_or_o_Array[8] && x_or_o_Array[0] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//left to right diagonal
    if(x_or_o_Array[2] == x_or_o_Array[4] && x_or_o_Array[4] == x_or_o_Array[6] && x_or_o_Array[2] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//right to left diagonal

    if(x_or_o_Array[0] == x_or_o_Array[3] && x_or_o_Array[3] == x_or_o_Array[6] && x_or_o_Array[0] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//first row across
    if(x_or_o_Array[1] == x_or_o_Array[4] && x_or_o_Array[4] == x_or_o_Array[7] && x_or_o_Array[1] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//first row across
    if(x_or_o_Array[2] == x_or_o_Array[5] && x_or_o_Array[5] == x_or_o_Array[8] && x_or_o_Array[2] != ''){Navigator.push(context, MaterialPageRoute(builder: (context) => ColorFillGame()) );x_or_o_Array = ["", "","","","","","","","",];}//first row across


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
    Navigator.push(context, MaterialPageRoute(builder: (context) => gameTwo()) );
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

class gameTwo extends StatefulWidget{
  const gameTwo({super.key});
  @override
  State<gameTwo> createState() =>_gameTwoState();

}

class _gameTwoState extends State<gameTwo> {
  Color _currentColor = Colors.grey;

  Random rand = Random();
  var side1;
  var side2;
  String _ColorName='';
  int _points=0;


  Color red= Color.fromRGBO(255, 0, 0, 1.0);
  Color blue= Color.fromRGBO(0, 0, 255, 1.0);
  Color green= Color.fromRGBO(0, 255, 0, 1.0);


  Color _genRandColor()
  {
    var Colorarr = [red,blue,green];
    side1 = rand.nextInt(3);
    return Colorarr[side1];
  }

  String _genColorName()
  {
    String colorName ='';
    var Namearr =['Red','Blue','Green'];
    side2 = rand.nextInt(3);
    return colorName=Namearr[side2];
  }

  void handleLeftButtonPress() {
    // add your logic here for when the left button is pressed
    setState(()
    {
      if(side1!=side2)
      {
        _points++;
      }
      if (_points ==10){Navigator.push( context, MaterialPageRoute(builder: (context) => Home() )   );}
      _currentColor = _genRandColor();
      _ColorName = _genColorName();
    });
  }

  void handleRightButtonPress() {
    setState(() {
      if(side1==side2)
      {
        _points++;
      }
      if (_points ==10){Navigator.push( context, MaterialPageRoute(builder: (context) => Home() )   );}
      _currentColor = _genRandColor();
      _ColorName = _genColorName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned
          (
          top: 20,
          left: 20,
          child: Text(
              '$_points',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: handleLeftButtonPress,
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: handleRightButtonPress,
                child: Text('Yes'),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
              width: 200,
              height: 200,
              color: _currentColor,
              child:  Center(
                child: Text(
                  _ColorName,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
          ),
        ),
      ],
    );
  }
}










