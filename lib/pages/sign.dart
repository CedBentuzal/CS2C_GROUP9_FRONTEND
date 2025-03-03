import 'package:flutter/material.dart';
import 'package:namer_app/widget/custom_widget.dart';
import 'package:namer_app/components/sign_up.dart';

class Sign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: CustomScaffold(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.20),
            padding: EdgeInsets.only(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.15,
              right: screenWidth * 0.15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Transform.translate(
              offset: Offset(0, -screenHeight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(0, -35),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFF816635),
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
