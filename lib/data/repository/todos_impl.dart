import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:todo_app_clean/domain/model/todo.dart';

import '../../domain/model/todos.dart';
import '../../domain/repository/todos.dart';
import '../source/files.dart';

class TodosRepositoryImpl extends TodosRepository {
  final Files files;

  late final String path = 'todos.json';

  TodosRepositoryImpl(this.files);

  @override
  Future<void> deleteAllTodos() async {
    await files.delete(path);
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = await loadTodos();
    final newTodos = todos.values.where((t) => t.id == id).toList();
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<Todos> loadTodos() async {
    final content = await files.read(path);
    if (content == null) return const Todos(values: []);
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();

    final existing =
        todos.values.firstWhereOrNull((element) => element.id == todo.id);
    if (existing != null) {
      final newTodo = existing.copyWith(
          id: todo.id,
          title: todo.title,
          description: todo.description,
          complated: todo.complated);
      final newTodos =
          todos.values.map((e) => e.id == todo.id ? newTodo : e).toList();
      await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
      return;
    } else {
      final newTodos = [...todos.values, todo];
      await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
    }
  }
}
