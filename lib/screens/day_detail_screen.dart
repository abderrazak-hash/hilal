import 'package:flutter/material.dart';
import 'package:tictactoe/data/database.dart';
import 'package:tictactoe/widgets/3ibadat.dart';
import 'package:tictactoe/consts.dart';
import 'package:tictactoe/screens/days_screen.dart';
import 'package:tictactoe/widgets/checkCircle.dart';

class DayDetail extends StatefulWidget {
  final int day;
  DayDetail({required this.day});

  @override
  State<DayDetail> createState() => _DayDetailState();
}

class _DayDetailState extends State<DayDetail> {
  @override
  void initState() {
    super.initState();
    setState(() {
      activeDay = widget.day;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeDay == ramadhanDay + 1) {
      Ramadhan.updateDay(activeDay);
      setState(() {
        ramadhanDay = activeDay;
      });
    }
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);
        // No route is found
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Days()));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // Ramadan Day
              RamadanDay(day: widget.day),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(15.0),
                  children: [
                    // Niya
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          ': تجديد النية',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: blue,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Circle(orange, 'niya'),
                      ],
                    ),
                    // Hadith
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: orange,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                        border: Border.all(color: blue, width: 2.0),
                      ),
                      child: Text(
                        ': قال رسول الله صلى الله عليه وسلم\n إنما اﻷعمال بالنيات',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Fara2id
                    Text(
                      ': الفرائض الخمس',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: blue,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Fara2id(),
                    SizedBox(height: 20.0),
                    // Sonan
                    Text(
                      ': السنـــــن',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: blue,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Sonan(),
                    SizedBox(height: 30.0),
                    // Nawafil
                    Text(
                      ': النوافـــل',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: orange,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Nawafil(),
                    SizedBox(height: 40.0),
                    // Wird
                    Text(
                      ': الورد القرآنـــي  ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: blue,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          backgroundColor: blue.withOpacity(.3)),
                    ),
                    SizedBox(height: 5.0),
                    WirdQuran(),
                    // Adkar
                    SizedBox(height: 40.0),
                    Text(
                      ': اﻷذكــار اليومية  ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: blue,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          backgroundColor: blue.withOpacity(.3)),
                    ),
                    SizedBox(height: 5.0),
                    Adkar(),
                    SizedBox(height: 30.0),
                    // Douaa
                    Text(
                      '  : الدعــاء   ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        backgroundColor: orange.withOpacity(.8),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Douaa(),
                    SizedBox(height: 30.0),
                    Center(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context, builder: (context) => Others());
                        },
                        child: Text(
                          'عبادات أخرى',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    //Others(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
