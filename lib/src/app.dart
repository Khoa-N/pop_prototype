import 'package:flutter/material.dart';
import 'navigation/parse_path.dart';
import 'navigation/page_provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pop_prototype',
      onGenerateRoute: _getRoute,
    );
  }

  Route _getRoute(RouteSettings settings) {
    var path = settings.name;
    var result = ParsePath.validate(path);

    switch (result) {
      case ParseResult.Landing:
        return _buildRoute(settings, landingPage());
      case ParseResult.Home:
        return _buildRoute(settings, homePage());
      case ParseResult.Login:
        return _buildRoute(settings, loginPage());
      case ParseResult.UserProfile:
        return _buildRoute(settings, userProfile());
      case ParseResult.NotificationScreen:
        return _buildRoute(settings, notificationScreen());
      case ParseResult.SearchScreen:
        return _buildRoute(settings, searchScreen());
      case ParseResult.CameraScreen:
        return _buildRoute(settings, cameraScreen());
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
