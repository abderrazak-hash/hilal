import 'package:flutter/material.dart';
import 'package:tictactoe/consts.dart';
import 'package:tictactoe/data/database.dart';
import 'package:tictactoe/screens/days_screen.dart';
import 'package:tictactoe/screens/login_screen.dart';

void main() => runApp(MaterialApp(
      home: SafeArea(child: Hillal()),
      debugShowCheckedModeBanner: false,
    ));

class Hillal extends StatefulWidget {
  const Hillal({Key? key}) : super(key: key);

  @override
  State<Hillal> createState() => _HillalState();
}

class _HillalState extends State<Hillal> {
  void getRamadhan() async {
    ramadhan = await Ramadhan.getMonth();
  }

  void getUser() async {
    Map<String, dynamic> u = await Ramadhan.getUser();
    setState(() {
      user = u['user']!;
      selectedAvatar = u['avatar']!;
      ramadhanDay = u['ramadhanDay']!;
    });
  }

  @override
  void initState() {
    super.initState();
    getRamadhan();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: user == 'no_user' ? LoginScreen() : Days(),
    );
  }
}
