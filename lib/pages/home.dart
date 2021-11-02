import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userTask;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList
        .addAll(['Почистить зубы', 'Приготовить завтрак', 'Проверить почту']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(
                    icon:
                        const Icon(Icons.delete_sweep, color: Colors.redAccent),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Добавить задачу'),
                    content: TextField(
                      onChanged: (String value) {
                        _userTask = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              todoList.add(_userTask);
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Добавить')),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}
