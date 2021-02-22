import 'package:first_app/result.dart';
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
      'answerText': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answerText': [
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 2},
        {'text': 'Rabbit', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite movie?',
      'answerText': [
        {'text': 'Tenet', 'score': 1},
        {'text': 'Pulp Fiction', 'score': 5},
        {'text': 'Inception', 'score': 10}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
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
            : Result(_totalScore, _resetQuiz),
      ),
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.blue),
    );
  }
}
