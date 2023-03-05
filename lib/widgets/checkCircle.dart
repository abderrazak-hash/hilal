import 'package:flutter/material.dart';

import 'package:tictactoe/consts.dart';
import 'package:tictactoe/data/database.dart';

class Circle extends StatefulWidget {
  final Color clr;
  final String ibada;
  Circle(this.clr, this.ibada);

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38.0,
        width: 38.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3.0, color: widget.clr),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              ramadhan[activeDay - 1][widget.ibada] =
                  ramadhan[activeDay - 1][widget.ibada] == 1 ? 0 : 1;
            });
            Ramadhan.updateIbada(
                activeDay, widget.ibada, ramadhan[activeDay - 1][widget.ibada]);
          },
          child: ramadhan[activeDay - 1][widget.ibada] == 1
              ? Icon(
                  Icons.check,
                  color: widget.clr,
                  size: 30.0,
                )
              : null,
        ));
  }
}
