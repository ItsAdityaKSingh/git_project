import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerButton extends StatelessWidget{
  AnswerButton( {super.key,required this.answertext,required this.onTap});

  final String answertext;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        
        backgroundColor: Color.fromARGB(96, 125, 61, 215),
        foregroundColor: Colors.amber,
        shape: 
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child:  Text(
        answertext,
      textAlign: TextAlign.center,
      ),
      );
    
  }
}