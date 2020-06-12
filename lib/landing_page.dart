
import 'package:flutter/material.dart';
import 'package:time_tracker/authentication/auth.dart';
import 'package:time_tracker/home_page.dart';
import 'authentication/sign_in.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,

            );
          }
          return HomePage(
            auth: auth,

          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        });
      }



}
