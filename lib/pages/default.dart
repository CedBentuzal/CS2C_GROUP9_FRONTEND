import 'package:flutter/material.dart';
import 'package:namer_app/pages/login.dart';
import 'package:namer_app/widget/default_button.dart';
import 'package:namer_app/pages/sign.dart';
import 'package:namer_app/widget/default_widget.dart';

class DefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: DefaultScaffold(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buttons(
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                ),
                SizedBox(width: screenWidth * 0.15),
                Buttons(
                  text: 'Sign up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sign()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
