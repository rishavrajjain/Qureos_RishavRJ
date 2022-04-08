import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

import '../page/email_logged_in_page.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}

class LoginApi {
  static Future<void> login(
      String email, password, BuildContext context, bool isLoginPage) async {
    String abc;
    if (isLoginPage) {
      abc = 'login';
    } else {
      abc = 'register';
    }
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/$abc'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        //var data = jsonDecode(response.body.toString());
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SignUpPage(email: email),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(isLoginPage ? 'Login In Failed' : 'Sign Up Failed'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
