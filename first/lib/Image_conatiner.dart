import 'package:first/StyleText.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class ImageConatiner extends StatefulWidget {
  const ImageConatiner({super.key});

  @override
  State<ImageConatiner> createState() {
    return _ImageConatiner();
  }
}

class _ImageConatiner extends State<ImageConatiner> {
  var rolldice = 1;
  RollDice(){
    setState(() {
      rolldice = Random().nextInt(6)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StyleText("Hello I am Ranjan Alok"),
        const SizedBox(
          height: 20,
        ),
        Image.asset('assets/image/dice-$rolldice.png',width: 200,height: 200,),
        const SizedBox(
          height: 20,
        ),
        TextButton(onPressed: (){RollDice();}, child: const Text("Roll" , style: TextStyle(fontSize: 20),))
      ],
    );
  }
}
