import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const DiceHP(title: 'My Dice App'),
    );
  }
}

class DiceHP extends StatefulWidget {
  const DiceHP({super.key, required this.title});

  final String title;

  @override
  State<DiceHP> createState() => _DiceHP();
}

class _DiceHP extends State<DiceHP> {
  int face = 1;
  Random random = Random();

  void rollDice() {
    setState(() {
      face = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "img/dice-$face.png",
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text("Shuffle Me"),
            ),
          ],
        ),
      ),
    );
  }
}
