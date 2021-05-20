import 'package:flutter/material.dart';
import 'package:todo_appe/modele/todo.dart';
import 'package:todo_appe/util/dbhelper.dart';
import 'package:todo_appe/screens/todolist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<Todo> todos;
    // DbHelper helper = DbHelper();
    // helper.inisilizeDb().then((result) {
    //   helper.getTodos().then((result) => todos = result.cast<Todo>());
    // });

    // DateTime today = DateTime.now();
    // Todo todo =
    //     Todo("Controle PFE", today.toString(), 1, "Here we have a pros");
    // var result = helper.insertTodo(todo);

    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(title: 'Todos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoList(),
    );
  }
}
