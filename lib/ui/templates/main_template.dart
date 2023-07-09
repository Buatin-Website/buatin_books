import 'package:flutter/material.dart';

class MainTemplate extends StatelessWidget {
  const MainTemplate({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: body,
        ));
  }
}
