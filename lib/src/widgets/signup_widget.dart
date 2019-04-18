import 'package:flutter/material.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_provider.dart';
import '../auth/email_auth.dart';

class SignupWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = AuthProvider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          usernameField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
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
            //hintText: 'you@example.com',
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
              //hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget usernameField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.validUsernames,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeUsername,
          decoration: InputDecoration(
            //hintText: 'Re-Enter Password',
            labelText: 'Enter A Username',
          ),
        );
      },
    );
  }

  Widget submitButton(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Sign up'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.newUser : null,
        );
      },
    );
  }

  Widget logoutButton(AuthBloc bloc) {
    return FutureBuilder(
      future: loginStatus(),
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
