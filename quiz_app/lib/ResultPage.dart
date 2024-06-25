import 'package:flutter/material.dart';
import 'MCQ.dart';
class ResultPage extends StatefulWidget {
  const ResultPage(
      {required this.map, required this.toggle, required this.mcqs, super.key});
  final Map<int, int> map;
  final List<MCQ> mcqs;
  final Function(int) toggle;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const Center(
              child: Text(
            "Result",
            style: TextStyle(
                color: Color.fromARGB(255, 8, 144, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
          ...widget.mcqs.map((mcq) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "${mcq.id}.${mcq.question}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 8, 144, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  mcq.options[mcq.correctOptionIndex],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.map[mcq.id] == null
                      ? "not selected "
                      : mcq.options[widget.map[mcq.id] ?? 0],
                  style: TextStyle(
                      fontSize: 18,
                      color: mcq.correctOptionIndex == widget.map[mcq.id]
                          ? Colors.green
                          : Colors.red),
                )
              ],
            );
          }),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              widget.toggle(1);
              widget.map.clear();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF000000),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(80, 15, 80, 15)),
            child: const Text(
              'Start again',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
