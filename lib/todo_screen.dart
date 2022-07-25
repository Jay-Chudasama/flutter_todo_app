import 'package:flutter/material.dart';

import 'home.dart';

class TodoScreen extends StatelessWidget {

  late List<Todo> todos;


  TodoScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor:Colors.white,title: const Text("Your Todos",)),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            if(todos[index].todo.isEmpty){
              return Container();
            }
            return ListTile(
                minLeadingWidth: 50,
                leading: Container(
                  width: 70,
//                  decoration:
//                  BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(todos[index].time.toString() + ':00'),
                        Text(todos[index].AM ? 'AM' : "PM"),
                      ]),
                ),
                title:Text(todos[index].todo));
          }),

    );
  }
}
