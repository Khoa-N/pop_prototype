import 'package:flutter/material.dart';
import 'auth_bloc.dart';

class AuthProvider extends InheritedWidget {
  final authBloc = AuthBloc();

  AuthProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider)
        .authBloc;
  }
}
