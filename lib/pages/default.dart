import 'package:flutter/material.dart';
import 'package:namer_app/widget/default_button.dart';

class DefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFA48C60),
        body: Center(
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(30, 90),
                child: Image.asset(
                  'assets/Thrift.png',
                  width: screenWidth * 0.80,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: screenHeight * 0.40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buttons(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  SizedBox(width: screenWidth * 0.15),
                  Buttons(
                    text: 'Sign up',
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
