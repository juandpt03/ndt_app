import 'package:go_router/go_router.dart';
import 'package:ndt_app/features/home/domain/entities/content.dart';
import 'package:ndt_app/features/home/presentation/screens/home/home_screen.dart';
import 'package:ndt_app/features/home/presentation/screens/screens.dart';
import 'package:ndt_app/features/quiz_game/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      name: HomeScreen.routeName,
    ),
    GoRoute(
      path: '/ogInfo',
      builder: (context, state) {
        final Content data = state.extra as Content;

        return OgInfoScreen(data: data);
      },
      name: OgInfoScreen.routeName,
    ),
    GoRoute(
      path: '/og:index',
      builder: (context, state) {
        final Content data = state.extra as Content;
        final String index = state.pathParameters['index'] ?? '';

        return OgScreen(
          data: data,
          index: index,
        );
      },
      name: OgScreen.routeName,
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
      name: WelcomeScreen.routeName,
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) => const QuizScreen(),
      name: QuizScreen.routeName,
    ),
    GoRoute(
      path: '/quizResult:totalQuestions',
      builder: (context, state) {
        final String totalQuestions =
            state.pathParameters['totalQuestions'] ?? '0';
        return QuizResultScreen(
          totalQuestions: totalQuestions,
        );
      },
      name: QuizResultScreen.routeName,
    ),
  ],
);
