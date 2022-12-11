import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicionar uma tarefa",
                          hintText: "Ex: Estudar Flutter"),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = todoController.text;
                      setState(() {
                        Todo newTodo =
                            Todo(title: text, dateTime: DateTime.now());
                        todos.add(newTodo);
                      });
                      todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00f7f3),
                      padding: const EdgeInsets.all(14),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Todo todo in todos)
                      TodoListItem(todo: todo)
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Você possui ${todos.length} tarefas pendentes",
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00f7f3),
                      padding: const EdgeInsets.all(14),
                    ),
                    child: const Text(
                      "Limpar tudo",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
