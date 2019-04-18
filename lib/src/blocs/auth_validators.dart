import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email.');
    }
  });

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    var userquery =
        Firestore.instance.collection('usernames').document(username).get();
    if (username.length > 3 && userquery != null) {
      sink.add(username);
    } else {
      sink.addError('Username is already taken.');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 7) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 4 characters.');
    }
  });

  final validateUser = StreamTransformer<FirebaseUser, bool>.fromHandlers(
      handleData: (user, sink) {
    user != null ? sink.add(true) : sink.addError('Not signed in.');
  });
}
