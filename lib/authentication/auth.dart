import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  User({@required this.uid});

  final String uid;
}

abstract class AuthBase{
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase{
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }


}
