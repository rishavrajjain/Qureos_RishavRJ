import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoggedInPage extends StatelessWidget {
  final GoogleSignInAccount user;
  const LoggedInPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome ${user.email}')),
    );
  }
}
