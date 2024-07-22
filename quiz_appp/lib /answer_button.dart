// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class AnswerButton extends StatelessWidget{
//   AnswerButton( {super.key,required this.answertext,required this.onTap});

//   final String answertext;
//   final void Function() onTap;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onTap,
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),

//         backgroundColor: Color.fromARGB(96, 125, 61, 215),
//         foregroundColor: Colors.amber,
//         shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
//       child:  Text(
//         answertext,
//       textAlign: TextAlign.center,
//       ),
//       );

//   }
// }
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answertext;
  final void Function() onTap;

  const AnswerButton({
    Key? key,
    required this.answertext,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Set background to transparent
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ).copyWith(
          side: WidgetStateProperty.all(BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 2,
          )),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF87CEEB), // Light sky blue
                Color(0xFF4682B4), // Steel blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            answertext,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
