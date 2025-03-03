import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  CustomScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0BB94),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
