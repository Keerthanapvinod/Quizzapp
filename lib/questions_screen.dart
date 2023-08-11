import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
class QuestionsSceen extends StatefulWidget{
  const QuestionsSceen({super.key,required this.onSelectedAnswer,});

  final void Function(String answer) onSelectedAnswer;
  
  @override
  State<QuestionsSceen>createState(){
    return _QuestionsSceen();
  }
}

class _QuestionsSceen extends State<QuestionsSceen>{
  var currentQuestionIndex=0;
  
  void answerQuestion(String selectedAnswers){
    widget.onSelectedAnswer(selectedAnswers);
    //currentQuestionIndex=currentQuestionIndex +1;
    //currentQuestionIndex+=1;
    setState(() {
      currentQuestionIndex++; //increment the valu by one 

    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: [
           Text(currentQuestion.text,
           style:GoogleFonts.lato(
            color:const Color.fromARGB(255, 205, 28, 184),
            fontSize:24,
            fontWeight:FontWeight.bold,
           ),
           textAlign: TextAlign.center,
           ),
          const SizedBox(height: 30,),
          ...currentQuestion.shuffledAnswers.map((answer){
            return AnswerButton(
              answerText: answer,
             onTap:(){
              answerQuestion(answer);
             },);
          })
         
        ],
        ),
      ),
    );

  }
}
