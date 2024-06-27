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
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 72, 237, 221)),
        useMaterial3: true,
      ),
      home: const DiceHP(title: 'Dice App'),
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
        backgroundColor:
            Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "img/dice-$face.png",
              height: 350,
              width: 350,
            ),
            const SizedBox(height: 35),
            OutlinedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 35),
              ),
              child: const Text("ROLL"),
            ),
          ],
        ),
      ),
    );
  }
}