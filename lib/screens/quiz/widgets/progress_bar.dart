import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
            children: [
              LayoutBuilder(
                builder: ((context, constraints) => Container(
                      width: constraints.maxWidth * controller.animation.value,
                      decoration: BoxDecoration(
                          gradient: KPrimaryGradient,
                          borderRadius: BorderRadius.circular(50)),
                    )),
              ),
              Positioned.fill(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: KDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      SvgPicture.asset("assets/icons.clock.svg")
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
