import 'package:flutter/material.dart';
import 'package:http_requests/models/todo.dart';
import 'package:http_requests/services/http_service.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  late Future<List<Todo>?> todos;
  ScrollController scrollController = ScrollController();
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    todos = HttpService.fetchTodos();
    scrollController.addListener(() {
      if (scrollController.offset !=
          scrollController.position.minScrollExtent) {
        setState(
          () {
            isVisible = true;
          },
        );
      } else {
        setState(
          () {
            isVisible = false;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: FutureBuilder(
        future: todos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Todo> todos = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                controller: scrollController,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  Todo todo = todos[index];
                  return Card(
                    color: Colors.amber[300],
                    child: ListTile(
                      title: Text(todo.title!),
                      leading: Text('${todo.id}'),
                      subtitle: Text('${todo.userId}'),
                      trailing: Icon(
                        todo.completed! ? Icons.check : Icons.cancel,
                        color: todo.completed! ? Colors.green[900] : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: isVisible
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                scrollController.jumpTo(
                  0.0,
                );
              },
            )
          : const SizedBox(),
    );
  }
}
