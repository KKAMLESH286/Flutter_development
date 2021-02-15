import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {
  

  

  
    var _questionIndex = 0;

    void _answerQuestion(){
      setState(()=>{
        _questionIndex = _questionIndex+1
      });
      
      
    }

    @override
  Widget build(BuildContext context){

    var questions = [
      'What\'s your favourite color?',
      'What\'s your favourite animal?',
      'What\'s your favourite movie?'
    ];
    return MaterialApp(home: Scaffold(appBar: AppBar(
    title: Text('Simple Quiz App', style: TextStyle(fontSize: 25),),
    centerTitle: true,
    elevation: 30,
    
  ),
  body: Column(
    children: [
    Question(questions[_questionIndex],
    ),


    Answer(_answerQuestion),
    Answer(_answerQuestion),
    Answer(_answerQuestion),  
   ]),


    ),
    theme: ThemeData(primarySwatch: Colors.blue, accentColor:Colors.blue),
    );
  }
} 


