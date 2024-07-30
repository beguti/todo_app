import 'dart:convert';

import 'package:todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";
  final String addurl = "https://dummyjson.com/todos/add";

  //TAMAMLANMAYANLARI ÇEK
  Future<List<ToDo>> getUncompleted() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<ToDo> todos = List.empty(growable: true);

    for (var element in resp) {
      ToDo task = ToDo.fromJson(element);
      if (task.completed == false) {
        todos.add(task);
      }
    }
    return todos;
  }

  //TAMAMLANANLARI ÇEK
  Future<List<ToDo>> getCompleted() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<ToDo> todos = List.empty(growable: true);

    for (var element in resp) {
      ToDo task = ToDo.fromJson(element);
      if (task.completed == true) {
        todos.add(task);
      }
    }
    return todos;
  }

//POSTLAMA
  Future<String> addToDo(ToDo newToDo) async {
    final response = await http.post(Uri.parse(addurl),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: json.encode(newToDo.toJson()));
    return response.body;
  }
}
