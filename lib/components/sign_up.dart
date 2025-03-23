import 'package:flutter/material.dart';
import 'package:namer_app/pages/default.dart';
import 'package:namer_app/widget/text_field.dart';
import 'package:namer_app/components/sign_service.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
            hintText: "Username",
            obscureText: false,
            controller: _usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Username cannot be empty";
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.04),
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
          SizedBox(height: screenHeight * 0.04),
          CustomTextField(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please confirm your password";
              }
              if (value != _passwordController.text) {
                return "Passwords do not match";
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
                  String? message = await SignupService.signUpUser(
                    username: _usernameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  if (!mounted) return; // ✅ Ensure widget is still in the tree

                  if (message == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signup successful!')),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DefaultPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFA48C60),
              ),
              child: Text(
                'Sign up',
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
