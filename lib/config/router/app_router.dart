import 'package:go_router/go_router.dart';
import 'package:ndt_app/features/home/domain/entities/content.dart';
import 'package:ndt_app/features/home/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      name: HomeScreen.routeName,
    ),
    GoRoute(
      path: '/og',
      builder: (context, state) {
        final Content data = state.extra as Content;

        return OgScreen(data: data);
      },
      name: OgScreen.routeName,
    ),
  ],
);
