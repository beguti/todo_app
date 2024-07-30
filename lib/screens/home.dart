import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
      type: TaskType.calendar,
      title: "Study Lessons",
      description: "Study COMP-117 lessons",
      isCompleted: false,
    ),
    Task(
      type: TaskType.note,
      title: "Run 5K",
      description: "Run 5K for today",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Go to party",
      description: "Attend to the party",
      isCompleted: false,
    ),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  //List<String> completed = ["Game meetup", "Take out trash"];

  List<Task> completed = [
    Task(
      type: TaskType.calendar,
      title: "Game meetup",
      description: "Game meetup at COMP-117 lessons",
      isCompleted: false,
    ),
    Task(
      type: TaskType.note,
      title: "Take out trash",
      description: "Take out trash for today",
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              //HEADER
              Container(
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
              //TOP COLUMN
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          task: todo[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
              //COMPLETED TEXT
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              //BOTTOM COLUMN
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: completed.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          task: completed[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor(purbleColor),
                  foregroundColor: Colors.white,
                  //shape: const RoundedRectangleBorder(
                  //borderRadius:
                  // BorderRadius.zero, // Köşeleri yuvarlak olmaktan çıkarır
                  // ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewTaskScreen(
                      addNewTask: (newTask) => addNewTask(newTask),
                    ),
                  ));
                },
                child: const Text("Add New Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
