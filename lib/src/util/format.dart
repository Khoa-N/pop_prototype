import 'package:flutter/material.dart';

String numFormat(int) {
  if (int < 1000) {
    return int.toString();
  } else if (int < 10000) {
    return (int ~/ 1000).toString() + ',' + (int % 1000).toString();
  } else if (int < 100000) {
    return (int ~/ 1000).toString() +
        '.' +
        ((int % 1000) ~/ 100).toString() +
        'K';
  } else if (int < 1000000) {
    return (int ~/ 1000).toString() + 'K';
  } else
    return (int ~/ 1000000).toString() + 'M';
}
