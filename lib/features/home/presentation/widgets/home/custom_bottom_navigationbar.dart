import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndt_app/features/home/presentation/providers/providers.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DotNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.4),
        paddingR: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        backgroundColor: Colors.black26,
        currentIndex: currentIndex,
        enablePaddingAnimation: true,
        onTap: (index) {
          ref.read(navigationBarProvider.notifier).update((state) => index);
        },
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: 22,
            ),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(
              FontAwesomeIcons.video,
              size: 22,
            ),
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(
              FontAwesomeIcons.gamepad,
              size: 22,
            ),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(
              FontAwesomeIcons.robot,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
