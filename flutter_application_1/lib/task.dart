import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_application_1/task_2.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  Future<Album> futureAlbum;
  List<String> _todoItems = [];

  get external => null;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  void _addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Project "${_todoItems[index]}"'),
              actions: <Widget>[
                new TextButton(
                    child: new Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                // ignore: missing_required_param
                new TextButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    }),
                new TextButton(
                    child: new Text('GO TO "${_todoItems[index]}"'),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TodoList_2()))),
              ]);
        });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
        title: new Text(todoText), onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Todo App')),
        body: _buildTodoList(),
        floatingActionButton: new FancyButton(
          onPressed: _pushAddTodoScreen,
        ));
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Add a new project')),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context);
            },
            decoration: new InputDecoration(
                hintText: 'Enter a project to do...',
                contentPadding: const EdgeInsets.all(16.0)),
          ));
    }));
  }
}
