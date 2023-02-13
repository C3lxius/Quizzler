import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Quizzlerr',
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> icon = [];

  void verifyAnswer(bool userAnswer) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "Amazeballs!",
                desc: "You\'ve reached the end of the quiz.")
            .show();
        quizBrain.resetQuestion();
        icon.clear();
      } else {
        if (quizBrain.getAnswer() == userAnswer) {
          icon.add(Icon(
            Icons.check,
            color: Colors.teal,
          ));
        } else {
          icon.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              quizBrain.getQuestion(),
              style: TextStyle(fontSize: 20.0),
            )),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            color: Colors.teal,
            child: TextButton(
              onPressed: () {
                verifyAnswer(true);
              },
              child: Text(
                'Yes, It\'s True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            color: Colors.redAccent,
            child: TextButton(
              onPressed: () {
                verifyAnswer(false);
              },
              child: Text(
                'Taaar!! False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: icon,
          ),
        ),
      ],
    );
  }
}
