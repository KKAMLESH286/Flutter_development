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
    final questions = const [
      {
      'questionText':'What\'s your favourite color?', 
      'answerText': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favourite animal?',
      'answerText': ['Dog', 'Cat', 'Rabbit']
      },
      {
        'questionText': 'What\'s your favourite movie?',
      'answerText': ['Tenet', 'Pulp Fiction', 'Inception']
      }
    ];

  

  
    var _questionIndex = 0;
    
    void _answerQuestion(){
      
      setState(()=>{
        _questionIndex = _questionIndex+1
        
      });
      if (_questionIndex < questions.length) {
          print('We have more questions!');
    } else {
      print('No more questions!');
    }
      
    }

    @override
  Widget build(BuildContext context){

    
    return MaterialApp(home: Scaffold(appBar: AppBar(
    title: Text('Simple Quiz App', style: TextStyle(fontSize: 25),),
    centerTitle: true,
    elevation: 30,
    
  ),
  body: _questionIndex < questions.length ? Column(
    children: [
    Question(
      questions[_questionIndex]['questionText'],
    ),


    ...(questions[_questionIndex]['answerText'] as List<String>).map((answerText){
      return Answer(_answerQuestion, answerText);
    }).toList()  
   ]): Center(child: Text('You did it'),) ,


    ),
    theme: ThemeData(primarySwatch: Colors.blue, accentColor:Colors.blue),
    );
  }
} 


