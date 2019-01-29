import 'package:firebase_auth/firebase_auth.dart';

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
}) {
  _auth.createUserWithEmailAndPassword(email: email, password: password);
  print('sign up');
}

Stream<FirebaseUser> loginStatus() => (_auth.onAuthStateChanged);

signOut() {
  _auth.signOut();
}
