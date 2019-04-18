import 'dart:async';
import 'auth_validators.dart';
import 'package:rxdart/rxdart.dart';
import '../auth/email_auth.dart';

class AuthBloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get username => _username.stream.transform(validateUsername);
  Stream<bool> get submitValidLogin =>
      Observable.combineLatest2(email, password, (e, p) => true);
  Stream<bool> get validSignUp =>
      Observable.combineLatest3(email, password, username, (e, p, u) => true);
  //Stream<bool> get validUser => loginStatus().transform(validateUser);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeUsername => _username.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');

    print(signIn(email: validEmail, password: validPassword));
  }

  newUser() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    final validUsername = _username.value;
    signUp(email: validEmail, password: validPassword);
  }

  logout() {
    signOut();
  }

  dispose() {
    _email.close();
    _password.close();
    _username.close();
  }
}
