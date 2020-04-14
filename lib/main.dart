import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 5},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': ['Cat', 'Dog', 'Rabbit'],
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Lion', 'score': 9},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 3},
      ],
    },
    {
      'questionText': 'Who\'s your favourite athlete?',
      'answers': [
        {'text': 'Ramos', 'score': 10},
        {'text': 'Zlatan', 'score': 8},
        {'text': 'Ronaldo', 'score': 5},
        {'text': 'Messi', 'score': 2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
