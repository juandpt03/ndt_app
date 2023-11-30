import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ndt_app/features/quiz_game/presentation/screens/quiz_screen.dart';
import 'package:quickalert/quickalert.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/game/welcome_transparent.png",
              height: size.height * 0.4,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Quiz Ondas Guiadas",
                style: textStyle.titleLarge?.copyWith(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const Shadow(
                      color: Colors.black87,
                      blurRadius: 10,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed(QuizScreen.routeName);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.red,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                child: const Text(
                  "Jugar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.info,
                    text: 'Contacto: juandpt03@gmai.com',
                    confirmBtnColor: Colors.red,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                child: const Text(
                  "Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
