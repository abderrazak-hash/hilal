import 'package:flutter/material.dart';

import 'dart:math';

import 'package:tictactoe/widgets/checkCircle.dart';
import 'package:tictactoe/consts.dart';

class WirdQuran extends StatelessWidget {
  const WirdQuran({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        Text(
          'الورد\nالقرائي',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: black,
            fontSize: 20.0,
          ),
        ),
        SizedBox(width: 15.0),
        Circle(orange, 'read_quran'),
        SizedBox(width: 30.0),
        Text(
          'الورد\nالسماعي',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: black,
            fontSize: 20.0,
          ),
        ),
        SizedBox(width: 15.0),
        Circle(orange, 'listen_quran'),
      ],
    );
  }
}

class Nawafil extends StatelessWidget {
  const Nawafil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: orange.withOpacity(.8),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        border: Border.all(color: blue, width: 2.0),
      ),
      child: Column(
        children: [
          // Dho7a
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 200.0,
                  child: Text(
                    'صلاة الضحى',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Circle(blue, 'douha'),
            ],
          ),
          SizedBox(height: 8.0),
          // Tarawi7
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200.0,
                child: Text(
                  'قيـام الليــل',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Circle(blue, 'kiyam'),
            ],
          ),
        ],
      ),
    );
  }
}

class RamadanDay extends StatelessWidget {
  final int day;
  RamadanDay({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -60.0,
            top: -70,
            child: Transform.rotate(
                angle: pi * -.10,
                child: Container(
                  height: 180.0,
                  width: 220.0,
                  color: white,
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 130.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(30.0)),
                      border: Border.all(color: blue, width: 2.0),
                    ),
                  ),
                )),
          ),
          Positioned(
            right: 35.0,
            top: 10,
            child: Text(
              (day < 10 ? '0' : '') + day.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: blue,
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 170.0,
            top: 30,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'رمضــان',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Fara2id extends StatelessWidget {
  const Fara2id({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Wodou2
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              child: Text(
                'الوضوء قبل اﻵذان ودعاء الوضوء',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 30.0),
            Circle(orange, 'wodou2'),
          ],
        ),
        SizedBox(height: 5.0),
        // Adan
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              child: Text(
                'الترديد مع اﻵذان',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 30.0),
            Circle(orange, 'adan'),
          ],
        ),
        SizedBox(height: 5.0),
        // Siwak
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              child: Text(
                'التسوك قبل الصلاة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 30.0),
            Circle(orange, 'siwak'),
          ],
        ),
      ],
    );
  }
}

class Sonan extends StatelessWidget {
  final TextStyle style = TextStyle(
    color: white,
    fontSize: 15.0,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        border: Border.all(color: blue, width: 2.0),
      ),
      child: Table(
        children: [
          TableRow(
            children: [
              Text(
                'العشاء',
                style: style,
                textAlign: TextAlign.center,
              ),
              Text(
                'المغرب',
                style: style,
                textAlign: TextAlign.center,
              ),
              Text(
                'العصر',
                style: style,
                textAlign: TextAlign.center,
              ),
              Text(
                'الظهر',
                style: style,
                textAlign: TextAlign.center,
              ),
              Text(
                'الفجر',
                style: style,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35.0),
            ],
          ),
          TableRow(
            children: [
              SizedBox(),
              SizedBox(),
              Circle(orange, 'asr_before'),
              Circle(orange, 'dohr_before'),
              Circle(orange, 'fajr_before'),
              Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    'قبلية',
                    style: style,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Circle(orange, 'isha_after'),
              Circle(orange, 'maghrib_after'),
              SizedBox(),
              Circle(orange, 'dohr_after'),
              SizedBox(),
              Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    'بعدية',
                    textAlign: TextAlign.right,
                    style: style,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Circle(orange, 'isha_dikr'),
              Circle(orange, 'maghrib_dikr'),
              Circle(orange, 'asr_dikr'),
              Circle(orange, 'dohr_dikr'),
              Circle(orange, 'fajr_dikr'),
              Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    'اﻷذكار',
                    textAlign: TextAlign.right,
                    style: style,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Adkar extends StatelessWidget {
  const Adkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Isti9ad
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160.0,
              child: Text(
                'أذكــار الاستيقاظ',
                style: TextStyle(
                  color: black,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Circle(orange, 'getting_up'),
          ],
        ),
        SizedBox(height: 5.0),
        // Saba7
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160.0,
              child: Text(
                'أذكــار الصبـــاح',
                style: TextStyle(
                  color: black,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Circle(orange, 'morning'),
          ],
        ),
        SizedBox(height: 5.0),
        // Masaa2
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160.0,
              child: Text(
                'أذكــار المســــاء',
                style: TextStyle(
                  color: black,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Circle(orange, 'evening'),
          ],
        ),
        SizedBox(height: 5.0),
        // Nawm
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160.0,
              child: Text(
                'أذكـــار النـــــوم',
                style: TextStyle(
                  color: black,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Circle(orange, 'sleeping'),
          ],
        ),
      ],
    );
  }
}

class Douaa extends StatelessWidget {
  const Douaa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160.0,
            child: Text(
              'دعــاء السحـــر',
              style: TextStyle(
                color: black,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Circle(orange, 'sahar'),
        ],
      ),
      SizedBox(height: 5.0),
      Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160.0,
            child: Text(
              'دعــاء اﻹفطــار',
              style: TextStyle(
                color: black,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Circle(orange, 'iftar'),
        ],
      ),
    ]);
  }
}

class Others extends StatelessWidget {
  const Others({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(192, 235, 252, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              border: Border.all(
                color: orange,
                width: 2.0,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'عبادات أخرى',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160.0,
                      child: Text(
                        'النوم على طهارة',
                        style: TextStyle(
                          color: Color.fromRGBO(17, 157, 167, 1),
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Circle(orange, 'tahara'),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160.0,
                      child: Text(
                        'خبيـــئة',
                        style: TextStyle(
                          color: Color.fromRGBO(17, 157, 167, 1),
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Circle(orange, 'hidden'),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160.0,
                      child: Text(
                        'جلسة الفجر',
                        style: TextStyle(
                          color: Color.fromRGBO(17, 157, 167, 1),
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Circle(orange, 'jalsa'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
