import 'package:flutter/material.dart';
import 'navigation/parse_path.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News!',
      onGenerateRoute: _getRoute,
    );
  }

  Route _getRoute(RouteSettings settings) {
    var path = settings.name;
    var result = ParsePath.validate(path);

    switch (result) {
      case ParseResult.Home:
        return _buildRoute(settings, new Home());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      maintainState: false,
      builder: (BuildContext context) => builder,
    );
  }
}
