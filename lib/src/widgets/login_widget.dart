import 'package:flutter/material.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_provider.dart';

class LoginWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final authBloc = AuthProvider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(authBloc),
          passwordField(authBloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(authBloc),
          logoutButton(authBloc),
        ],
      ),
    );
  }

  Widget emailField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget reenterPasswordField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.validPasswords,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeReenterPassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Re-Enter Password',
              labelText: 'Re-Enter Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget submitButton(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }

  Widget logoutButton(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.validUser,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Sign Out'),
          color: Colors.red,
          onPressed: snapshot.hasData ? bloc.logout : null,
        );
      },
    );
  }
}
