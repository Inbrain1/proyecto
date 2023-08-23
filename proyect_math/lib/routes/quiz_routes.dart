import 'package:flutter/material.dart';
import 'package:proyect_math/routes/play_quiz.dart';

import '../screen/Questions_screen.dart';
import '../screen/help_quiz_screen.dart';
import '../screen/made_by_screen.dart';


class AppRoutes {
  static const initialRote = 'homepage';
  static final Playquiz = <playQuiz>[
    playQuiz(route: 'iniciar :D', screen: const QuestionsScreen()),
    playQuiz(route: 'De que tratara esta encuesta', screen: HelpScreen()),
    playQuiz(route: 'MadeBy', screen: MadeByScreen())
  ];

  static Map<String, Widget Function(BuildContext)> playAppRoutes() {
    Map<String, Widget Function(BuildContext)> playRoutes = {};
    for (final option in Playquiz) {
      playRoutes.addAll({option.route: (BuildContext) => option.screen});
    }
    return playRoutes;
  }
}
