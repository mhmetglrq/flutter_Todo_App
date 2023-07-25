import 'package:flutter/material.dart';

class TodosNew extends StatelessWidget {
  const TodosNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: const Center(
        child: Text('Add Todo'),
      ),
    );
  }
}
