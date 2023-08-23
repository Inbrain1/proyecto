import 'package:flutter/material.dart';
import '../clases/quiz.dart';
import '../custom/buildresult_dialogo_custom.dart';
import '../custom/export_custom.dart';
import '../data/question_parser.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionsIndex = 0;
  int progressIndex = 0;
  final int totalQuestions = 5;
  final int totalOptions = 4;
  Quiz quiz = Quiz(name: 'Quiz de Capitales', questions: []);

  final parser = QuestionParser();

  Future<void> readJson() async {
    final questions = await parser.generateQuestions(
        totalQuestions: totalQuestions, totalOptions: totalOptions);
    quiz.questions.addAll(questions);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(String selected) {
    quiz.questions[questionsIndex].selected = selected;
    if (selected == quiz.questions[questionsIndex].answer) {
      quiz.questions[questionsIndex].correct = true;
      quiz.right += 1;
    }

    progressIndex += 1;
    if (questionsIndex < totalQuestions - 1) {
      questionsIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => ResultsDialogCustom(
              totalQuestions: totalQuestions, quiz: quiz, context: context));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                color: Colors.purpleAccent.shade100,
                value: progressIndex / totalQuestions,
                minHeight: 20,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: quiz.questions.isNotEmpty
                  ? Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Text(
                              quiz.questions[questionsIndex].question,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalOptions,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.indigo,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ListTile(
                                    leading: Text(
                                      '${index + 1}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    title: Text(
                                      quiz.questions[questionsIndex]
                                          .options[index],
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    onTap: () => _optionSelected(quiz
                                        .questions[questionsIndex]
                                        .options[index]),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          TextButton(
            onPressed: () {
              _optionSelected('Saltar pregunta');
            },
            child: Text(
              'Saltar pregunta',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
