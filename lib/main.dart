import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start Quiz'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizPage()),
            );
          },
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<Map<String, dynamic>> _selectedQuestions = [];

  final List<Map<String, dynamic>> _allQuestions = [
    {
      "question": "What is the capital of France?",
      "options": ["London", "Berlin", "Paris", "Madrid"],
      "correctAnswer": 2
    },
    {
      "question": "Which planet is known as the Red Planet?",
      "options": ["Mars", "Jupiter", "Venus", "Saturn"],
      "correctAnswer": 0
    },
    {
      "question": "Who painted the Mona Lisa?",
      "options": [
        "Vincent van Gogh",
        "Leonardo da Vinci",
        "Pablo Picasso",
        "Michelangelo"
      ],
      "correctAnswer": 1
    },
    {
      "question": "What is the largest ocean on Earth?",
      "options": [
        "Atlantic Ocean",
        "Indian Ocean",
        "Arctic Ocean",
        "Pacific Ocean"
      ],
      "correctAnswer": 3
    },
    {
      "question": "Which country is home to the kangaroo?",
      "options": ["New Zealand", "South Africa", "Australia", "Brazil"],
      "correctAnswer": 2
    },
    {
      "question": "What is the chemical symbol for gold?",
      "options": ["Go", "Gd", "Au", "Ag"],
      "correctAnswer": 2
    },
    {
      "question": "Who wrote 'Romeo and Juliet'?",
      "options": [
        "Charles Dickens",
        "William Shakespeare",
        "Jane Austen",
        "Mark Twain"
      ],
      "correctAnswer": 1
    },
    {
      "question": "What is the largest planet in our solar system?",
      "options": ["Earth", "Mars", "Jupiter", "Saturn"],
      "correctAnswer": 2
    },
    {
      "question": "In which year did World War II end?",
      "options": ["1943", "1945", "1947", "1950"],
      "correctAnswer": 1
    },
    {
      "question": "What is the capital of Japan?",
      "options": ["Seoul", "Beijing", "Tokyo", "Bangkok"],
      "correctAnswer": 2
    },
    {
      "question": "Who is known as the father of computer science?",
      "options": ["Alan Turing", "Bill Gates", "Steve Jobs", "Mark Zuckerberg"],
      "correctAnswer": 0
    },
    {
      "question": "What is the largest mammal in the world?",
      "options": ["African Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
      "correctAnswer": 1
    },
    {
      "question": "Which element has the chemical symbol 'O'?",
      "options": ["Gold", "Silver", "Oxygen", "Iron"],
      "correctAnswer": 2
    },
    {
      "question": "Who was the first person to step on the moon?",
      "options": [
        "Buzz Aldrin",
        "Yuri Gagarin",
        "Neil Armstrong",
        "John Glenn"
      ],
      "correctAnswer": 2
    },
    {
      "question": "What is the capital of Brazil?",
      "options": ["Rio de Janeiro", "São Paulo", "Brasília", "Salvador"],
      "correctAnswer": 2
    },
    {
      "question": "Which of these is not a primary color?",
      "options": ["Red", "Blue", "Yellow", "Green"],
      "correctAnswer": 3
    },
    {
      "question": "Who wrote '1984'?",
      "options": [
        "George Orwell",
        "Aldous Huxley",
        "Ray Bradbury",
        "H.G. Wells"
      ],
      "correctAnswer": 0
    },
    {
      "question": "What is the largest desert in the world?",
      "options": [
        "Gobi Desert",
        "Kalahari Desert",
        "Sahara Desert",
        "Antarctic Desert"
      ],
      "correctAnswer": 3
    },
    {
      "question": "Which country is home to the Great Barrier Reef?",
      "options": ["Mexico", "Australia", "Thailand", "Maldives"],
      "correctAnswer": 1
    },
    {
      "question": "What is the smallest prime number?",
      "options": ["0", "1", "2", "3"],
      "correctAnswer": 2
    },
    {
      "question": "Who developed the theory of relativity?",
      "options": [
        "Isaac Newton",
        "Niels Bohr",
        "Albert Einstein",
        "Stephen Hawking"
      ],
      "correctAnswer": 2
    },
    {
      "question": "What is the capital of Canada?",
      "options": ["Toronto", "Vancouver", "Montreal", "Ottawa"],
      "correctAnswer": 3
    },
    {
      "question": "Which planet is known as the 'Morning Star'?",
      "options": ["Mars", "Venus", "Jupiter", "Mercury"],
      "correctAnswer": 1
    },
    {
      "question": "Who painted 'The Starry Night'?",
      "options": [
        "Claude Monet",
        "Salvador Dali",
        "Vincent van Gogh",
        "Pablo Picasso"
      ],
      "correctAnswer": 2
    },
    {
      "question": "What is the largest organ in the human body?",
      "options": ["Brain", "Liver", "Skin", "Heart"],
      "correctAnswer": 2
    },
    {
      "question": "Which country is home to the Taj Mahal?",
      "options": ["India", "Egypt", "Turkey", "Iran"],
      "correctAnswer": 0
    },
    {
      "question": "What is the chemical symbol for silver?",
      "options": ["Si", "Sv", "Ag", "Au"],
      "correctAnswer": 2
    },
    {
      "question": "Who wrote 'To Kill a Mockingbird'?",
      "options": [
        "Harper Lee",
        "J.D. Salinger",
        "F. Scott Fitzgerald",
        "Ernest Hemingway"
      ],
      "correctAnswer": 0
    },
    {
      "question": "What is the speed of light?",
      "options": [
        "299,792 km/s",
        "300,000 km/s",
        "199,792 km/s",
        "250,000 km/s"
      ],
      "correctAnswer": 0
    },
    {
      "question": "Which of these is not a gas giant planet?",
      "options": ["Jupiter", "Saturn", "Neptune", "Mars"],
      "correctAnswer": 3
    }
  ];

  @override
  void initState() {
    super.initState();
    _selectedQuestions = _getRandomQuestions();
  }

  List<Map<String, dynamic>> _getRandomQuestions() {
    final random = Random();
    List<Map<String, dynamic>> randomQuestions = [];
    List<int> indexes = List<int>.generate(_allQuestions.length, (i) => i);
    indexes.shuffle(random);
    for (int i = 0; i < 10; i++) {
      randomQuestions.add(_allQuestions[indexes[i]]);
    }
    return randomQuestions;
  }

  void _answerQuestion(int selectedOption) {
    setState(() {
      if (selectedOption ==
          _selectedQuestions[_currentQuestionIndex]['correctAnswer']) {
        _score++;
      }
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= 10) {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('Your score: $_score out of 10'),
          actions: <Widget>[
            TextButton(
              child: const Text('Restart Quiz'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                  _selectedQuestions = _getRandomQuestions();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Question ${_currentQuestionIndex + 1} of 10',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              _selectedQuestions[_currentQuestionIndex]['question'],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ..._selectedQuestions[_currentQuestionIndex]['options']
                .asMap()
                .entries
                .map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  child: Text(entry.value),
                  onPressed: () => _answerQuestion(entry.key),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
