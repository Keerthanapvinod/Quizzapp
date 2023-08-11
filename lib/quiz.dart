//import 'dart:html';

import 'package:flutter/material.dart';

import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/resltus_screen.dart';

class Quiz extends StatefulWidget {
 const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];
  var activeScreen= 'start-screen';

  void switchScreen (){
     setState(() {
      activeScreen= 'questions-screen'; 
    
     });
  }
  void chooseAnswers(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results_screen';
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers=[];
      activeScreen='questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget=StartScreen(switchScreen);

    if(activeScreen=='questions-screen'){
       screenWidget=QuestionsSceen(
        onSelectedAnswer: chooseAnswers,);
    }
     
     if (activeScreen=='results_screen'){
      screenWidget= ResultsScreen(
        choosenAnswers:selectedAnswers,
        onRestart: restartQuiz,
      );
     }
    return MaterialApp(
    home: Scaffold(
     body:Container(
      decoration:const BoxDecoration(
        gradient: LinearGradient(
         colors: [
           Color.fromARGB(221, 33, 28, 28),
           Color.fromARGB(255, 6, 11, 109),
          ],
          begin:Alignment.topLeft,
          end:Alignment.bottomRight, 
        ),
      ),
       child:screenWidget,
     ),
    ),
   );
  }
}