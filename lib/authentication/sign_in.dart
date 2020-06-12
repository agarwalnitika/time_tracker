import 'package:flutter/material.dart';
import 'package:time_tracker/authentication/auth.dart';
import 'package:time_tracker/authentication/sign_in_buttons.dart';
import 'package:time_tracker/common_widgets/custom_raised_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.auth});

  final AuthBase auth;
  Future<void> _signInAnonymously() async {
    try {
       await auth.signInAnonymously();

     // print("${authResult.user}");
    } catch (e) {
      print('${e.toString()}');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          CustomRaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/google.png',
                  height: 30,
                  width: 30,
                ),
                Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
                Opacity(
                    opacity: 0.0,
                    child: Image.asset(
                      'assets/google.png',
                      height: 30,
                      width: 30,
                    )),
              ],
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          CustomRaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/facebook.png',
                  height: 30,
                  width: 30,
                ),
                Text(
                  'Sign in with Facebook',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                Opacity(
                    opacity: 0.0,
                    child: Image.asset(
                      'assets/facebook.png',
                      height: 30,
                      width: 30,
                    )),
              ],
            ),
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[800],
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Go Anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
