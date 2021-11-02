import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text('Список дел'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green[300],
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/todo');
          },
          child: const Text('Старт'),
        ),
      ),
    );
  }
}
