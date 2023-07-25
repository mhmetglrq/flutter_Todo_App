import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_clean/presentation/viewmodel/module.dart';
import 'package:todo_app_clean/presentation/widgets/todo_tile.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosListState);
    final activeTodos = todos.active;
    final completedTodos = todos.completed;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Todos"),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/todos/new');
            },
            icon: const Icon(
              Icons.add,
            ),
            tooltip: 'Add Todo',
          ),
        ],
      ),
      body: Column(
        children: [
          activeTodos.isEmpty
              ? const Center(
                  child: Text("No Todos Found!"),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: activeTodos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final todo = activeTodos[index];
                      return TodoTile(todo: todo);
                    },
                  ),
                ),
          if (completedTodos.isNotEmpty)
            ExpansionTile(
              title: const Text("Completed"),
              children: [
                for (final todo in completedTodos) TodoTile(todo: todo),
              ],
            )
        ],
      ),
    );
  }
}
