import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(82, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the Fun Way!",
            style: GoogleFonts.lato(color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            label: const Text("Start Quiz!"),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(),
            ),
            onPressed: startQuiz,
          ),
        ],
      ),
    );
  }
}
