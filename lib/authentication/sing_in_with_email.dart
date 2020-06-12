import 'package:flutter/material.dart';
import 'package:time_tracker/authentication/auth.dart';
import 'package:time_tracker/authentication/email_form.dart';

class EmailSignIn extends StatefulWidget {
  EmailSignIn({@required this.auth});
  final AuthBase auth;
  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: EmailSignInForm(auth: widget.auth),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

}

