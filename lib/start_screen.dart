import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});


  final void Function() startQuiz;

  @override
  Widget build(context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
       children:[
      
          Image.asset(
          'assets/images/quiz-logo.png',
               width:300,
               color: const Color.fromARGB(255, 211, 174, 60),
              ),
       //Opacity(
         // opacity: 0.6,
         // child: Image.asset(
          //'assets/images/quiz-logo.png',
            //   width:300,
              // ),
       // ),
       const SizedBox(height: 80,),
       const Text('Leran fluter the fun way!',
       style: TextStyle(
        color: Color.fromARGB(255, 208, 188, 188),
        fontSize: 28,
       ),
       ),
       const SizedBox(height: 30,),
       OutlinedButton.icon(
        onPressed: startQuiz,
        style:OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        icon:const Icon(Icons.arrow_right_alt),
        label:const Text('Start Quiz'),
       )
       ]
      ),
    );

  }
}