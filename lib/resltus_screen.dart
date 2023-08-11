//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summmar.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({
    super.key,
    
    required this.choosenAnswers,
    required this.onRestart,
    });
   final void Function() onRestart;
   final List<String> choosenAnswers;

   List<Map<String,Object>>get summaryData{
  final List<Map<String,Object>>summery =[];

  for (var i=0;i<choosenAnswers.length;i++){
    summery.add(
      {
        'questions_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':choosenAnswers[i]
      },
    );
  }
  return summery;
   }
  @override
  Widget build(BuildContext context) {
  
    final numTotalQuestion=questions.length;
    final numCorrectQuestion=summaryData.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length;

    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text('your answer $numCorrectQuestion out of $numTotalQuestion questions correcctly! ',
                           style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 232, 220, 220),
                           fontSize: 20),
                           ),
                           const SizedBox(height: 20,
                         ),
                          QuestionsSummary(summaryData ),
                          const SizedBox(height: 20,
                          ),
                          TextButton.icon(
                           onPressed: onRestart,
                           style: TextButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 213, 189, 189),
                           ), 
                           icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                          label:const Text('Restart Quiz'),
                          )
                        ],
             ),
      ),
       
    );
      
  }
}