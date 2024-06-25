import 'package:flutter/material.dart';
import 'MCQ.dart';
import 'question.dart';
class SurveyPage extends StatefulWidget {
  final Function(int) toggle;
  final Function(int, int) answerQuestion;
  const SurveyPage(
      {required this.answerQuestion,
      required this.mcqs,
      required this.toggle,
      super.key});
  final List<MCQ> mcqs;
  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 70, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Ultimate Flutter Survey",
            style: TextStyle(
                color: Color.fromARGB(255, 8, 144, 255),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "Choose the correct option that best answers each multiple-choice question.",
            style: TextStyle(fontSize: 15),
          ),
          ...widget.mcqs.map((mcq) {
            return Question(mcq: mcq, answerQuestion: widget.answerQuestion);
          }),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.toggle(3);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF000000),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 15)),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

