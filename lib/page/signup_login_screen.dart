import 'package:flutter/material.dart';

import '../api/sign_in_api.dart';

class SignUpScreen extends StatefulWidget {
  final bool isLoginPage;
  const SignUpScreen({Key? key, required this.isLoginPage}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(widget.isLoginPage ? 'Login' : 'Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
               await LoginApi.login(emailController.text.toString(),
                    passwordController.text.toString(),context,widget.isLoginPage);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(widget.isLoginPage ? 'Login' : 'Sign Up'),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text('FOR TESTING USE:'),
            const Text('Email: eve.holt@reqres.in'),
            const Text('Password: pistol')
          ],
        ),
      ),
    );
  }
}
