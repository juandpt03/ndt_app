import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndt_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:ndt_app/features/home/presentation/providers/providers.dart';
import 'package:ndt_app/features/home/presentation/screens/screens.dart';
import 'package:ndt_app/features/home/presentation/widgets/widgets.dart';
import 'package:ndt_app/features/quiz_game/presentation/screens/screens.dart';
import 'package:ndt_app/features/videos/presentation/screens/screens.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final isDark = ref.watch(themeProvider).isDark;
    final boxDecoration = isDark
        ? BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF0B223D),
                const Color(0xFF08182C).withValues(alpha: 0.3),
              ],
            ),
          )
        : BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                colors.primary,
                const Color(0XFF576E89),
              ],
            ),
          );
    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF0a1f39) : const Color(0XFF526d8b),
      body: Stack(
        children: [
          Container(
            decoration: boxDecoration,
          ),
          const Positioned(
            bottom: 150,
            child: HomeBackground(),
          ),
          IndexedStack(
            index: ref.watch(navigationBarProvider),
            children: const [
              HomeView(),
              VideosScreen(),
              WelcomeScreen(),
              ChatScreen(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: ref.watch(navigationBarProvider),
      ),
    );
  }
}
