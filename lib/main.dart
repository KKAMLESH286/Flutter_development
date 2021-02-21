import 'package:flutter/material.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
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

  void _answerQuestion() {
    setState(() => {_questionIndex = _questionIndex + 1});
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Simple Quiz App',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          elevation: 30,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.blue),
    );
  }
}
