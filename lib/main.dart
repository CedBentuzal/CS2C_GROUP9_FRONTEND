import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/sign.dart';
import 'pages/default.dart';

void main() => runApp(
      MaterialApp(
        home: DefaultPage(),
        routes: {
          '/sign': (context) => Sign(),
          '/login': (context) => login(),
          '/default': (context) => DefaultPage(),
        },
      ),
    );
