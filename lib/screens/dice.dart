import 'dart:math';

import 'package:flutter/material.dart';

class DiceRollerScreen extends StatefulWidget {
  const DiceRollerScreen({super.key});

  @override
  State<DiceRollerScreen> createState() => _DiceRollerScreenState();
}

class _DiceRollerScreenState extends State<DiceRollerScreen> {
  Random random = Random();
  int diceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 5,
        title: Center(
          child: Text(
            "Dice Roller App",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: TextButton(
                    child: Image.asset('assets/images/dice$diceNumber.png'),
                    onPressed: () {
                      setState(() {
                        setNewDice();
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: ElevatedButton(
                child: Text(
                  "THROW",
                  style: TextStyle(color: Colors.pink),
                ),
                onPressed: () {
                  setState(() {
                    setNewDice();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void setNewDice() {
    diceNumber = random.nextInt(6) + 1;
  }
}
