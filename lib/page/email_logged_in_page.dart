import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final String email;
  const SignUpPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome $email'),
      ),
    );
  }
}
