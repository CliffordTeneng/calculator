import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 

  int firstVal = 0;
  int secondVal = 0;
  int answer = 0;
  bool isOperatorChosen = false;

  String _selectedValue = ""; 
  String operatorr = "";

  Map<String, String> _numbers ={
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',
    'zero': '0',
    'dot': '.',
    'openP': '(',
    'closedP': ')',
  };

  void displayDigits(String number){
    setState(() {
        _selectedValue += number;
    });
  }

  void clear(){
    setState(() {
      _selectedValue = "";
      answer = 0;
    });
  }

  void clears(){
    setState(() {
      _selectedValue = "";
    });
  }


  void displayAnswer(){
    setState(() {
      switch (operatorr) {
        case '+':
          answer += int.parse(_selectedValue); 
          print(answer);
          break;
        default:
      }
    });
  }

  void performOperation(String chosenOperator){
    setState(() {
      switch (chosenOperator) {
        case '+':
          operatorr = chosenOperator;
          isOperatorChosen = true;
          answer += int.parse(_selectedValue);                  
          print(answer);        
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              answer.toString(),
            ),
            SizedBox(height: 20,),
            Text(_selectedValue.toString(),),
            SizedBox(height: 20,),
            Row(children: <Widget>[
              FlatButton(child: Text('7'), onPressed: (){ if(isOperatorChosen){ isOperatorChosen =false; clears(); displayDigits(_numbers['seven']);}else{displayDigits(_numbers['seven']);} },),
              FlatButton(child: Text('8'), onPressed: (){ displayDigits(_numbers['eight']); },),
              FlatButton(child: Text('9'), onPressed: (){ displayDigits(_numbers['nine']); },),
              FlatButton(child: Text('del'), onPressed: clear,),
            ],),
            Row(children: <Widget>[
              FlatButton(child: Text('4'), onPressed: (){ displayDigits(_numbers['four']); },),
              FlatButton(child: Text('5'), onPressed: (){ displayDigits(_numbers['five']); },),
              FlatButton(child: Text('6'), onPressed: (){ displayDigits(_numbers['six']); },),
              FlatButton(child: Text('÷'), onPressed: (){},),
            ],),
            Row(children: <Widget>[
              FlatButton(child: Text('1'), onPressed: (){ displayDigits(_numbers['one']); },),
              FlatButton(child: Text('2'), onPressed: (){ displayDigits(_numbers['two']); },),
              FlatButton(child: Text('3'), onPressed: (){ displayDigits(_numbers['three']); },),
              FlatButton(child: Text('×'), onPressed: (){},),
            ],),
            Row(children: <Widget>[
              FlatButton(child: Text('.'), onPressed: (){ displayDigits(_numbers['dot']); },),
              FlatButton(child: Text('0'), onPressed: (){ displayDigits(_numbers['zero']); },),
              FlatButton(child: Text('^'), onPressed: (){},),
              FlatButton(child: Text('-'), onPressed: (){},),
            ],),
            Row(children: <Widget>[
              FlatButton(child: Text('('), onPressed: (){ displayDigits(_numbers['openP']); },),
              FlatButton(child: Text(')'), onPressed: (){ displayDigits(_numbers['closedP']); },),
              FlatButton(child: Text('='), onPressed: (){displayAnswer();},),
              FlatButton(child: Text('+'), onPressed: (){performOperation("+");},),
            ],),
          ],
        ),
      ),
    );
  }
}
