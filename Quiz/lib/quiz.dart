import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/result_screen.dart';


class Quiz extends StatefulWidget{

  const Quiz({super.key});



  @override
State<StatefulWidget> createState() {
    
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  var activeScreen='start-screen';
   List<String> selectedAnswers=[];



  

  void switchScreen(){
    setState(() {
      activeScreen='questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length==questions.length) {
      setState(() {
      activeScreen='result-screen';
      
        
      });
      
    }
  }

@override
  Widget build( context) {

  Widget screenWidget=StartScreen(switchScreen);
  if(activeScreen=='questions-screen'){
    screenWidget= QuestionScreen(
      onSelectAnswer: chooseAnswer,
    );

  }
  if(activeScreen=='result-screen'){
    screenWidget= ResultScreen(
      choosenAnswer: selectedAnswers,
    );
  }
   
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
       body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 44, 7, 187),
              Color.fromARGB(255, 21, 2, 54),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
        ),
        child:  screenWidget,
        ),
    ),
  );
  
  }
}