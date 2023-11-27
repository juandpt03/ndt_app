import 'package:flutter/material.dart';
import 'package:ndt_app/features/home/domain/domain.dart';

class OgScreen extends StatelessWidget {
  final Content data;
  static const routeName = 'og';
  const OgScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data.title),
        leading: const AppBarIcon(),
      ),
      body: const Center(
        child: Text('OgScreen'),
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
