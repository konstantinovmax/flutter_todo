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

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: const Text('Меню'),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green[300],
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/todo', (route) => false);
            },
            child: const Text(
              'К списку',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_outlined),
            onPressed: _menuOpen,
          ),
        ],
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
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
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
                  title: const Text(
                    'Добавить задачу',
                    textAlign: TextAlign.center,
                  ),
                  content: TextField(
                    onChanged: (String value) {
                      _userTask = value;
                    },
                  ),
                  actions: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[300],
                            ),
                            onPressed: () {
                              setState(() {
                                todoList.add(_userTask);
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Добавить'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[300],
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Отменить'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}
