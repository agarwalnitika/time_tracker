import 'package:flutter/material.dart';
import 'package:time_tracker/authentication/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth});

  final AuthBase auth;

  Future<void> _confirmSignOut(BuildContext context) async {
    final didSignOutRequest = showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sign In Failed'),
            content: Text('Are you sure you want to logout?'),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Text('OK'),
                      onPressed: () => _signOut,
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await auth.signOut();

      // print("${authResult.user}");
    } catch (e) {
      print('${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
    );
  }
}
