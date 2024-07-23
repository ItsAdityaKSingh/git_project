import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
    ResultScreen({
      super.key,
      required this.choosenAnswer,
      required this.onRestart,
      });
  final void function() onRestart;
  final List<String> choosenAnswer;

  List<Map<String,Object> >getSummaryData(){
    final List<Map<String,Object>> summary=[];

    for(int i=0;i<choosenAnswer.length;i++){
      summary.add({
        "question_index":i,
        "question":questions[i].question,
        "correct_answer":questions[i].answers[0],
        "choosen_answer":choosenAnswer[i]
        });

    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final totalQuestions=questions.length;
    final correctAnswer=summaryData.where((element){
      return element['correct_answer']==element['chosen_answer'];
    }).length;
    return Container(
      margin: const EdgeInsets.all(40),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,  
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text("Answer $correctAnswer out of $totalQuestions correctly",
           style: GoogleFonts.lato(color:Colors.amber,fontSize: 24),
           textAlign: TextAlign.center,
           
           ),
          const SizedBox(
            height: 30,

          ),
          QuestionsSummary(getSummaryData()),
          const SizedBox(
            height: 30,
          ),
          TextButton(onPressed: (){}, child: const Text("Restart Quiz"),
          )

        ],
      ),

    );
  }
}