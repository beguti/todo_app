import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Bildirim çubuğna ve alttaki butonlara basmamızı engelliyor
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Container(
            width: deviceWidth,
            height: deviceHeight / 3,
            decoration: BoxDecoration(
              color: HexColor(purbleColor),
              image: const DecorationImage(
                image: AssetImage("lib/assets/images/header.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "October 20, 2022",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "My Todo List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
