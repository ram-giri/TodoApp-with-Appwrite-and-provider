import 'package:appwrite_todo_app/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final allTodos = Provider.of<TodoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('My Todos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: allTodos.todos.length,
        itemBuilder: ((context, index) {
          return Card(
            margin: const EdgeInsets.all(12.0),
            child: ListTile(
                tileColor: Colors.lightBlue,
                textColor: Colors.black,
                leading: Text(
                  "${index + 1}.",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                title: Text(allTodos.todos[index].title),
                subtitle: Text(
                  allTodos.todos[index].disc,
                )),
          );
        }),
      ),
    );
  }
}
