import 'dart:async';

enum ParseResult {
  InvalidPath,
  Start,
  Home,
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

    if (elements[1].isEmpty && elements.length == 2) return ParseResult.Home;
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

  static bool _isIndex(String check) {
    return check.contains(new RegExp(r"^[0-9]+$"));
  }

  static bool _isBookColl(String check) {
    return check.contains(new RegExp(r"^(normal|emergency)$"));
  }

  static bool _isListColl(String check) {
    return check.contains(new RegExp(r"^(items|alternatives)$"));
  }

  static bool _isItemColl(String check) {
    return check.contains(new RegExp(r"^(true|false|notes)$"));
  }

  static bool _isId(String check) {
    return check.contains(new RegExp(r"^[0-9a-f]{14}$"));
  }
}

class ParsedItems {
  ParsedItems({this.result});

  final ParseResult result;
}
