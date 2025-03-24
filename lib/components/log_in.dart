import 'package:flutter/material.dart';
import 'package:namer_app/pages/dashboard.dart';
import 'package:namer_app/widget/text_field.dart';
import 'package:namer_app/components/login_service.dart'; // Ensure this file exists and contains the LoginService class
// Replace with your actual page

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email cannot be empty";
              }
              if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                  .hasMatch(value)) {
                return "Enter a valid email address";
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.04),
          CustomTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.05),
          SizedBox(
            width: screenWidth * 0.60,
            height: screenHeight * 0.05,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String? message = await LoginService.loginUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  if (message == "success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login successful!')),
                    );

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message ?? 'Login failed')),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFA48C60),
              ),
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
