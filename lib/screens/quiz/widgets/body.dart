import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/controllers/question_controller.dart';
import 'package:quizapp/screens/quiz/widgets/progress_bar.dart';
import 'package:quizapp/screens/quiz/widgets/question_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/icons/bg.svg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(
                height: KDefaultPadding,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: KDefaultPadding),
                child: Obx(() => Text.rich(TextSpan(
                        text:
                            "Question ${_questionController.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: kSecondaryColor),
                          )
                        ]))),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: KDefaultPadding,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
