import 'package:flutter/material.dart';
import 'package:flutter_application_1/task.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/const.dart';
import 'package:flutter_application_1/const.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

void onLogin(String email, String password) {
  // A completer
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: taskRoute,
    );
  }
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Todo App', home: new TodoList());
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

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case feedRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Feed(data));
      case taskRoute:
        return MaterialPageRoute(builder: (_) => TodoApp());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => TODOLogin(onLogin: onLogin));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
