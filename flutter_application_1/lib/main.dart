import 'package:flutter/material.dart';

void main() => runApp(TODOApp());

class Task {
  String _name;
  bool _completed;

  Task(this._name);

  getName() => this._name;
  setName(name) => this._name = name;

  isCompleted() => this._completed;
  setCompleted(completed) => this._completed = completed;
}

class TODOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TODO();
  }
}

class TODO extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TODOState();
  }
}

class TODOState extends State<TODO> {
  final List<Task> tasks = [];

  void onTaskCreated(String name) {
    setState(() {
      tasks.add(Task(name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => TODOList(tasks: tasks),
        '/create': (context) => TODOCreate(
              onCreate: onTaskCreated,
            ),
      },
    );
  }
}

class TODOList extends StatelessWidget {
  final List<Task> tasks;

  TODOList({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO app'),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].getName()),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/create'),
          child: Icon(Icons.add)),
    );
  }
}

class TODOCreate extends StatefulWidget {
  final onCreate;

  TODOCreate({@required this.onCreate});

  @override
  State<StatefulWidget> createState() {
    return TODOCreateState();
  }
}

class TODOCreateState extends State<TODOCreate> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a task')),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                  autofocus: true,
                  controller: controller,
                  decoration:
                      InputDecoration(labelText: 'Enter name for your task')))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          widget.onCreate(controller.text);
          Navigator.pop(context);
        },
      ),
    );
  }
}
