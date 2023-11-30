import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final String message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
