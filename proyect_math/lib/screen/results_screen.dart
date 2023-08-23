import 'package:flutter/material.dart';

import '../clases/quiz.dart';

class ResultsScreen extends StatelessWidget {
  final Quiz quiz;

  const ResultsScreen({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin:
                  const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo.shade50,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Preguntas:${quiz.questions.length}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Correctas:${quiz.percent}%',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: quiz.questions.length,
                itemBuilder: (_, i) {
                  return Card(
                    color: quiz.questions[i].correct
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                    child: ListTile(
                      leading: quiz.questions[i].correct
                          ? Icon(
                              Icons.check,
                              color: Colors.green.shade900,
                            )
                          : Icon(
                              Icons.close,
                              color: Colors.red.shade900,
                            ),
                      title: Text(quiz.questions[i].question),
                      subtitle: Text(quiz.questions[i].selected),
                    trailing: Text(quiz.questions[i].answer),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
