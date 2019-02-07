import 'package:flutter/material.dart';
import '../widgets/login_widget.dart';
import '../widgets/map_widget.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          MapWidget(),
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/white_balloon.png'),
                  fit: BoxFit.scaleDown),
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: 200.0,
                left: 30.0,
                right: 30.0,
              ),
              child: LoginWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
