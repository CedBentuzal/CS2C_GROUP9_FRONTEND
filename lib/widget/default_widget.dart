import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget child;

  DefaultScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0BB94),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Mobile background 3.png',
              fit: BoxFit.cover,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
