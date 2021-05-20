import 'package:flutter/material.dart';
import 'package:todo_appe/modele/todo.dart';
import 'package:todo_appe/util/dbhelper.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DbHelper dbhelper = DbHelper();
  List<Todo> todos = List<Todo>();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
          onPressed: null, tooltip: "Add New Todo", child: Icon(Icons.add)),
    );
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int postion) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(this.todos[postion].id.toString()),
            ),
            title: Text(this.todos[postion].title),
            subtitle: Text(this.todos[postion].date),
            onTap: () {
              debugPrint("Tapped on " + this.todos[postion].id.toString());
            },
          ),
        );
      },
    );
  }

  void getData() {
    final dbFuture = dbhelper.inisilizeDb();
    dbFuture.then((result) {
      final todosFuture = dbhelper.getTodos();
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        this.count = result.length;

        for (int i = 0; i < this.count; i++) {
          todoList.add(Todo.formObject(result[i]));
          debugPrint(todoList[i].title);
        }
        setState(() {
          this.todos = todoList;
          this.count = count;
        });

        debugPrint(" items : " + count.toString());
      });
    });
  }
}
