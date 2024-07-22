import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionScreen extends StatefulWidget {
   const QuestionScreen({super.key,required this.onSelectAnswer});

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  var currentQuestionIndex=0;


  answersQuestion(String answer){
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex+=1;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion=questions[currentQuestionIndex];
    return  SizedBox(
      width: double.infinity,
      child:  Container(
        margin: const EdgeInsets.all(40),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(currentQuestion.question,
             textAlign: TextAlign.center,
            style: GoogleFonts.lato(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
           ...currentQuestion.getShuffledAnswer().map((answer){
            return AnswerButton(answertext: answer,onTap: (){
              answersQuestion(answer);
            });
           }),
           ],
        ),
      ),
    );
  }
}

