import 'package:flutter/material.dart';

Color blue = Color.fromRGBO(2, 161, 191, 1),
    white = Colors.white,
    black = Color.fromRGBO(30, 47, 95, 1),
    orange = Color.fromRGBO(226, 139, 46, 1);

int activeDay = 0;
late int ramadhanDay;

late List<Map<String, dynamic>> ramadhan;

String user = '', selectedAvatar = '';
int summer(Iterable d) {
  int sum = 0;
  d.forEach((i) {
    sum += int.parse(i.toString());
  });
  return sum;
}
