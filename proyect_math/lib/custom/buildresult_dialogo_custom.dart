import 'package:flutter/material.dart';

import '../clases/quiz.dart';
import '../screen/results_screen.dart';

class ResultsDialogCustom extends StatelessWidget {
  const ResultsDialogCustom({
    Key? key,
    required this.totalQuestions,
    required this.quiz,
    required this.context,
  }) : super(key: key);

  final int totalQuestions;
  final Quiz quiz;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Resultados', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preguntas totales: $totalQuestions',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Correctas: ${quiz.right}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Incorrectas: ${(totalQuestions - quiz.right)}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Porcentaje: ${quiz.percent}%',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => ResultsScreen(
                    quiz: quiz
                )),
              ),
            );
          },
          child: Text(
            'See Reply',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
