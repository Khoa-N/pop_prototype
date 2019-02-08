import 'dart:async';

enum ParseResult {
  InvalidPath,
  Landing,
  Home,
  Login,
  UserProfile,
  CameraScreen,
  SearchScreen,
  NotificationScreen
}

class ParsePath {
  static ParseResult validate(String path) {
    var elements = path.split('/');

    return _validateHome(elements);
  }

  static ParseResult _validateHome(List<String> elements) {
    // Paths must start with /
    if (elements.length < 2 || elements[0].isNotEmpty)
      return ParseResult.InvalidPath;

    if (elements[1].isEmpty && elements.length == 2) return ParseResult.Landing;
    if (elements[1] == 'Home' && elements.length == 2) return ParseResult.Home;
    if (elements[1] == 'Login' && elements.length == 2)
      return ParseResult.Login;
    if (elements[1] == 'UserProfile' && elements.length == 2)
      return ParseResult.UserProfile;
    if (elements[1] == 'CameraScreen' && elements.length == 2)
      return ParseResult.CameraScreen;
    if (elements[1] == 'SearchScreen' && elements.length == 2)
      return ParseResult.SearchScreen;
    if (elements[1] == 'NotificationScreen' && elements.length == 2)
      return ParseResult.NotificationScreen;
    return null;
  }

  static String pop(String path) {
    if (validate(path) == ParseResult.InvalidPath)
      throw new ArgumentError("The path provided is not a valid path");

    var elements = path.split('/');
    if (elements[elements.length - 1] == 'use') elements.removeLast();
    elements.removeLast();
    var backPath = elements.join('/');
    if (backPath == '') backPath = '/';
    return backPath;
  }
}

class ParsedItems {
  ParsedItems({this.result});

  final ParseResult result;
}
