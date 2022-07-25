import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Todo {
  int time;
  bool AM;
  String todo;

  Todo(this.time, this.AM, this.todo);
}

class _HomeState extends State<Home> {
  List<Todo> todos = [Todo(9, true, "")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.apps,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodoScreen(todos)),
            );
          },
        )
      ], title: Center(child: const Text("To-Do App",style: TextStyle(color: Colors.white),))),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                minLeadingWidth: 50,
                leading: Container(
                  width: 70,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(todos[index].time.toString() + ':00'),
                        Text(todos[index].AM ? 'AM' : "PM"),
                      ]),
                ),
                title: TextField(
                  controller: TextEditingController()..text = todos[index].todo,
                  onChanged: (text) {
                    todos[index].todo = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your TODO here',
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () {
          setState(() {
            if (todos.last.time == 7 && todos.last.AM == false) {
              /// 7 PM
//              nothing
            } else {
              int lastTime = todos.last.time;
              if (lastTime == 12) {
                todos.add(Todo(1, false, ""));
              } else {
                int newTime = lastTime + 1;
                todos.add(
                    Todo(newTime, newTime == 12 ? false : todos.last.AM, ""));
              }
            }
          });
        },
      ),
    );
  }
}
