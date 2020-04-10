import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  static final String TAG = "QuestionAnswerScreen";
  @override
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question/Answer'),
        centerTitle: true,
      ),
    );
  }
}
