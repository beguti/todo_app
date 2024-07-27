import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: BoxDecoration(
                  color: HexColor(purbleColor),
                  image: const DecorationImage(
                    image:
                        AssetImage("lib/assets/images/add_new_task_header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                        child: Text(
                      "Add new task",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Task Title"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Category"),
                    IconsShow(addressImage: "lib/assets/images/category_1.png"),
                    IconsShow(addressImage: "lib/assets/images/category_2.png"),
                    IconsShow(addressImage: "lib/assets/images/category_3.png"),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    DateTimeSpace(title: "Date"),
                    DateTimeSpace(title: "Time"),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Notes"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SizedBox(
                  height: 300,
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.white, isDense: true),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor(purbleColor),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//DATE ve TIME YAZILARI KUTUSU
class DateTimeSpace extends StatelessWidget {
  final String title;

  const DateTimeSpace({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // 'text' değişkeni tanımlanmamıştı, 'title' kullanmanız gerekiyor
          Text(title),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // 'const' ekledim
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//ICON GOSTERME KISMI
class IconsShow extends StatelessWidget {
  final String addressImage;
  const IconsShow({super.key, required this.addressImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(microseconds: 300),
            content: Text("Category selected"),
          ),
        );
      },
      child: Image.asset(addressImage),
    );
  }
}
