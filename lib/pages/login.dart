import 'package:flutter/material.dart';
import 'package:namer_app/components/log_in.dart';
import 'package:namer_app/widget/custom_widget.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: CustomScaffold(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.40),
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
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF816635),
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
