import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import '../clases/question.dart';
import '../clases/quiz.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({
    super.key,
  });

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  Quiz quiz = Quiz(name: 'Quiz de Capitales', questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/paises.json');
    final List<dynamic> data = await json.decode(response);
    for (var item in data) {
      Question question = Question.fromJson(item);
      question.question += question.country;
      quiz.questions.add(question);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
      ),
      body: quiz.questions.isNotEmpty
          ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(
                      left: 8, right: 8, top: 2, bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo.shade50, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "Preguntas:${quiz.questions.length}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: quiz.questions.length,
                      itemBuilder: (_, i) {
                    return Card(
                      color: Colors.indigo.shade100,
                      child: ListTile(
                        leading: Text("${i + 1}"),
                        title: Text(quiz.questions[i].question),
                        trailing: Text(quiz.questions[i].answer),
                      ),
                    );
                  }),
                ),
              ],
            )
          : Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(color: Colors.white),
                ],
              ),
            ),
    );
  }
}
