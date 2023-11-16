import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        onTap: (index) {},
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(
              FontAwesomeIcons.sellsy,
            ),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.calculate_outlined),
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.inventory_outlined),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.robot),
          ),
        ],
      ),
    );
  }
}
