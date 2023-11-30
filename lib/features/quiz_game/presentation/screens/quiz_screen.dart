import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ndt_app/features/home/presentation/screens/home/home_screen.dart';
import 'package:ndt_app/features/quiz_game/domain/domain.dart';
import 'package:ndt_app/features/quiz_game/presentation/providers/providers.dart';
import 'package:ndt_app/features/quiz_game/presentation/screens/screens.dart';
import 'package:quickalert/quickalert.dart';

class QuizScreen extends ConsumerWidget {
  static const routeName = 'quiz';
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> resetCounters() async {
      Future.delayed(const Duration(milliseconds: 100));
      ref.invalidate(correctAnswersProvider);
      ref.invalidate(incorrectAnswersProvider);
    }

    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Size size = MediaQuery.of(context).size;

    final index = ref.watch(questionIndexProvider);
    return ref.watch(questionsProvider).when(
          data: (questions) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    resetCounters();
                    context.pushReplacementNamed(HomeScreen.routeName);
                  },
                ),
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.help_outlined, color: Colors.red),
                    onPressed: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.info,
                        text:
                            'Ondas Guiadas Cantidad de Preguntas ${questions.length} ',
                        confirmBtnColor: Colors.red,
                      );
                    },
                  ),
                ],
              ),
              backgroundColor: isDark
                  ? colors.primaryContainer.withOpacity(0.2)
                  : colors.primary,
              body: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                height: size.height,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _ImageQuestion(path: questions[index].image),
                      _Question(
                        question: questions[index].question,
                      ),
                      _QuestionOptions(
                        totalQuestions: questions.length,
                        question: questions[index],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.white54,
            ),
          ),
        );
  }
}

class _Question extends StatelessWidget {
  final String question;
  const _Question({
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Text(
          question,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

class _ImageQuestion extends StatelessWidget {
  final String path;
  const _ImageQuestion({
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        path,
        width: 300,
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _QuestionOptions extends ConsumerWidget {
  final int totalQuestions;
  final Question question;

  const _QuestionOptions({
    required this.totalQuestions,
    required this.question,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: colors.onBackground,
          fontSize: 15,
        );
    final Size size = MediaQuery.of(context).size;
    final index = ref.read(questionIndexProvider);
    void validate(int choice) {
      final correctAnswers = ref.read(correctAnswersProvider.notifier);
      final incorrectAnswers = ref.read(incorrectAnswersProvider.notifier);

      if (choice == question.answer) {
        correctAnswers.update((state) => state + 1);
      } else {
        incorrectAnswers.update((state) => state + 1);
      }

      if (index + 1 == totalQuestions) {
        context.pushReplacementNamed(
          QuizResultScreen.routeName,
          pathParameters: {'totalQuestions': totalQuestions.toString()},
        );
        ref.read(tryingProvider.notifier).update((state) => state = state + 1);
      } else {
        ref.read(questionIndexProvider.notifier).update((state) => state + 1);
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: size.height * 0.42,
      child: ListView.builder(
        itemBuilder: (context, choice) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: colors.primaryContainer,
                width: 2,
              ),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {
                validate(choice);
              },
              title: Text(
                question.options[choice],
                style: textStyle,
              ),
            ),
          );
        },
        itemCount: question.options.length,
      ),
    );
  }
}
