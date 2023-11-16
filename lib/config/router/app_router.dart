import 'package:go_router/go_router.dart';
// import 'package:ndt_app/features/home/presentation/screens/home/home_test.dart';
import 'package:ndt_app/features/home/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      name: HomeScreen.routeName,
    ),
    // GoRoute(
    //   path: '/home_test',
    //   builder: (context, state) => const HomeTest(),
    // ),
  ],
);
