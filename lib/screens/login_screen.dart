import 'package:flutter/material.dart';
import 'package:tictactoe/consts.dart';
import 'package:tictactoe/data/database.dart';
import 'package:tictactoe/screens/days_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget avatar(String avatar) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAvatar = avatar;
        });
      },
      child: Container(
        width: 60.0,
        padding: EdgeInsets.all(5),
        height: 60.0,
        decoration: BoxDecoration(
          color: selectedAvatar == avatar ? orange : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          maxRadius: 22.0,
          backgroundImage: AssetImage('assets/$avatar.jpg'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'مرحبا بك في تطبيق \nهـــلال',
                    style: TextStyle(
                      color: blue,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 60.0),
                Container(
                  width: 220.0,
                  height: 50.0,
                  child: TextField(
                    autofocus: true,

                    style: TextStyle(
                      color: blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      setState(() {
                        user = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    //maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 22.0),
                      hintText: 'أدخل اسمك',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: blue),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Center(
                    child: Text(
                  'اختر شخصيتك',
                  style: TextStyle(
                    color: blue,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    avatar('man'),
                    SizedBox(width: 30.0),
                    avatar('boy'),
                    SizedBox(width: 30.0),
                    avatar('woman'),
                  ],
                ),
                SizedBox(height: 60.0),
                TextButton(
                  onPressed: () {
                    if (selectedAvatar != '' && user != '') {
                      Ramadhan.updateUser(user, selectedAvatar);
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Days()));
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    backgroundColor: blue,
                  ),
                  child: Text(
                    'تــــابع',
                    style: TextStyle(
                      color: white,
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )));
  }
}
