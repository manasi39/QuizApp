import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAns = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAns(String ans) {
    selectedAns.add(ans);
    if (selectedAns.length == questions.length) {
      setState(() {
        //selectedAns = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAns=[];
      activeScreen='questions-screen';
    });
  }

  //Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen=StartScreen(switchScreen);
  //   super.initState();
  // }

  @override
  Widget build(context) {
    // final screenWidget=activeScreen == 'start-screen'
    //         ? StartScreen(switchScreen)
    //         : const QuestionsScreen(); //activeScreen,

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAns: chooseAns,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAns: selectedAns,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 241, 192, 209),
              Color.fromARGB(255, 214, 145, 168),
              Color.fromARGB(255, 119, 40, 66)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      )),
    );
  }
}
