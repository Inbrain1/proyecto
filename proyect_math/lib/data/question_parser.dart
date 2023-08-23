import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import '../clases/question.dart';

class QuestionParser {
  final random = Random();

  List<String> getAllCapitals(List<dynamic> data) {
    final List<String> result = [];
    for (final item in data) {
      result.add(item['capital']);
    }
    return result;
  }

  Future<List<Question>> generateQuestions(
      {required int totalQuestions, required int totalOptions}) async {
    final String response = await rootBundle.loadString('assets/paises.json');
    final List<dynamic> data = await json.decode(response);
    final List<Question> questions = [];
    final List<String> capitals = getAllCapitals(data);

    for (int i = 0; i < totalQuestions; i++) {
      int randomIndex = random.nextInt(data.length);
      Question question = Question.fromJson(data[randomIndex]);
      final List<String> options = [];

      // Asegurarse de que la respuesta correcta esté en las opciones
      options.add(question.answer);

      while (options.length < totalOptions - 1) {
        final option = capitals[random.nextInt(capitals.length)];
        if (option != question.answer && !options.contains(option)) {
          options.add(option);
        }
      }

      options.shuffle(); // Mezclar las opciones
      question.addOptions(options);
      questions.add(question);
    }
    return questions;
  }
}
