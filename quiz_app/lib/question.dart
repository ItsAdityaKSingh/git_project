import 'package:flutter/material.dart';
import 'MCQ.dart';
class Question extends StatefulWidget {
  final Function(int, int) answerQuestion;
  const Question({super.key, required this.mcq, required this.answerQuestion});
  final MCQ mcq;
  @override
  // ignore: library_private_types_in_public_api
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String _selectedOption = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${widget.mcq.id}.${widget.mcq.question}",
            style: const TextStyle(
              color: Color.fromARGB(255, 8, 144, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[0]),
            leading: Radio<String>(
              value: "A",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 0);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[1]),
            leading: Radio<String>(
              value: "B",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 1);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[2]),
            leading: Radio<String>(
              value: "C",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 2);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[3]),
            leading: Radio<String>(
              value: "D",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 3);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
        ],
      ),
    );
  }
}
