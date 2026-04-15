import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_page.dart';
import 'UI/background.dart';
import 'screens/home_page.dart';
import 'screens/result_page.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  
  List<String> selectedAnswers = [];
  var activeScreen = 'home-screen';

  /*@override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }*/

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'home-screen';
    });
  }

  @override
  Widget build(context){

    //final screenWidget = activeScreen == 'home-screen' ? HomePage(switchScreen) : const QuestionsScreen();

    Widget screenWidget = HomePage(switchScreen);

    if(activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            BackgroundGradient(),
            //if (activeScreen != null) activeScreen!,
            //activeScreen == 'home-screen' ? HomePage(switchScreen) : const QuestionsScreen(),
            screenWidget,
          ],
        ),
      ),
    );
  } 
}