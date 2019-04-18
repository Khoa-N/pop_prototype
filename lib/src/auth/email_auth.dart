import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

final FirebaseAuth _auth = FirebaseAuth.instance;

signIn({
  String email,
  String password,
}) {
  _auth.signInWithEmailAndPassword(email: email, password: password);
  print('sign in');
}

signUp({
  String email,
  String password,
  String username,
}) {
  _auth.createUserWithEmailAndPassword(email: email, password: password);
  print('sign up');
}

Future<FirebaseUser> loginStatus() async => (await _auth.currentUser());

signOut() {
  _auth.signOut();
}
