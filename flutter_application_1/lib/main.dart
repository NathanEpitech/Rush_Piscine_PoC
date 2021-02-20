import 'package:flutter/material.dart';
import 'package:flutter_application_1/task.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/task_2.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/const.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  TodoApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFFD58000),
            textTheme: ButtonTextTheme.accent,
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(secondary: Colors.white), // Text color
          ),
          backgroundColor: Colors.blue,
          brightness: Brightness.dark),
      home: new TodoList(),
    );
  }
}

void onLogin(String email, String password) {
  // A completer
}

class Navig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Navig', home: new TodoList_2());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, feedRoute, arguments: 'Data from home');
        },
      ),
      body: Center(child: Text('Home')),
    );
  }
}

class Feed extends StatelessWidget {
  final String data;
  Feed(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Feed: $data')),
    );
  }
}
