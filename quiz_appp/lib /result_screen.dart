import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';
import 'questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "chosen_answer": chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswer = summaryData.where((element) {
      return element['correct_answer'] == element['chosen_answer'];
    }).length;
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Answer $correctAnswer out of $totalQuestions correctly",
            style: GoogleFonts.lato(color: Colors.amber, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(getSummaryData()),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              onRestart();
            },
            child: const Text("Restart Quiz"),
          )
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'data/questions.dart';
// import 'questions_summary/questions_summary.dart';

// class ResultScreen extends StatelessWidget {
//   final List<String> chosenAnswer;
//   final void Function() onRestart;

//   const ResultScreen({
//     Key? key,
//     required this.chosenAnswer,
//     required this.onRestart,
//   }) : super(key: key);

//   List<Map<String, Object>> getSummaryData() {
//     final List<Map<String, Object>> summary = [];

//     for (int i = 0; i < chosenAnswer.length; i++) {
//       summary.add({
//         "question_index": i,
//         "question": questions[i].question,
//         "correct_answer":
//             questions[i].options[0], // Assuming the first option is correct
//         "chosen_answer": chosenAnswer[i],
//       });
//     }
//     return summary;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final summaryData = getSummaryData();
//     final totalQuestions = questions.length;
//     final correctAnswer = summaryData.where((element) {
//       return element['correct_answer'] == element['chosen_answer'];
//     }).length;

//     return Container(
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF87CEEB), // Light sky blue
//             Color(0xFF4682B4), // Steel blue
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 8,
//             offset: Offset(0, 4), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             "You answered $correctAnswer out of $totalQuestions questions correctly!",
//             style: GoogleFonts.lato(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           QuestionsSummary(summaryData),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: onRestart,
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Color(0xFF4682B4),
//               backgroundColor: Colors.white, // Steel blue
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//             child: const Text("Restart Quiz"),
//           ),
//         ],
//       ),
//     );
//   }
// }
