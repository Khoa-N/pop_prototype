import 'package:flutter/material.dart';
import '../blocs/login_bloc.dart';
import '../blocs/login_provider.dart';

class SignupWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          reenterPasswordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
          logoutButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
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

  Widget passwordField(Bloc bloc) {
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

  Widget reenterPasswordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.validPasswords,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeReenterPassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Re-Enter Password',
            labelText: 'Re-Enter Password',
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
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

  Widget logoutButton(Bloc bloc) {
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
