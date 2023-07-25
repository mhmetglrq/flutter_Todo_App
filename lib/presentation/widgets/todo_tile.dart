// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/todo.dart';
import '../viewmodel/module.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.title),
      subtitle: todo.description != null && todo.description!.isNotEmpty
          ? Text(todo.description!)
          : null,
      onTap: () {
        context.push('/todos/${todo.id}');
      },
      trailing: Checkbox(
        onChanged: (value) async {
          if (value != null) {
            final newTodo = todo.copyWith(complated: value, id: todo.id);
            await ref.read(todosListModel).save(newTodo);
          }
        },
        value: todo.complated,
      ),
    );
  }
}
