import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/result_screen.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';


var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        // selectedAnswers = [];
        activeScreen = ResultScreen(questions.length, selectedAnswers);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }
  
  Widget build(context){
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: const [Color.fromARGB(255, 207, 185, 245), Color.fromARGB(255, 76, 8, 124)],
              begin: startAlignment,
              end: endAlignment),
        ),
          child: activeScreen),
      ),
    );
  }
}