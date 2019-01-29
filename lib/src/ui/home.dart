import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Stack(
      children: <Widget>[
        SizedBox(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.pink),
            child: Text('HOME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                )),
          ),
        ),
      ],
    );
  }
}
