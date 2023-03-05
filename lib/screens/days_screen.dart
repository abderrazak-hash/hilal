import 'package:flutter/material.dart';
import 'package:tictactoe/consts.dart';
import 'package:tictactoe/screens/day_detail_screen.dart';

class Days extends StatelessWidget {
  Widget day(BuildContext context, int i) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Positioned(
              top: 67.5,
              left: i == 30 ? 20 : 0,
              child: Container(
                height: 15.0,
                width: i != 1 ? 250.0 : 120,
                color: orange,
              ),
            ),
            Container(
              height: 120.0,
              width: 120.0,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: orange, width: 4.0),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {
                  if (i <= ramadhanDay + 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DayDetail(day: i)));
                  }
                },
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (i < 10 ? '0' : '') + '$i',
                      style: TextStyle(
                        color: blue,
                        fontSize: 30.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      summer(ramadhan[i - 1].values).toString() + ' / 28',
                      style: TextStyle(
                        color: blue,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
              ),
            ),
            if (i == ramadhanDay)
              Positioned(
                right: 20.0,
                top: 6.0,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/$selectedAvatar.jpg'),
                ),
              )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 100.0),
                child: Text(
                  'أهــلا بك',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: blue,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                user,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blue,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                  controller: ScrollController(
                    initialScrollOffset:
                        (150 * (ramadhanDay - 1) - 105).toDouble(),
                  ),
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  children:
                      List.generate(30, (index) => day(context, index + 1))),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                'كل الحقوق محفوظة',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
