import 'package:flutter/material.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News!',
      onGenerateRoute: routes,
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

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        return NewsList();
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        final itemId = int.parse(settings.name.replaceFirst('/', ''));
        final commentsBloc = CommentsProvider.of(context);

        commentsBloc.fetchItemWithComments(itemId);

        return NewsDetail(
          itemId: itemId,
        );
      });
    }
  }
}
