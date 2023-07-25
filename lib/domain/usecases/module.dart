import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean/data/repository/module.dart';
import 'package:todo_app_clean/domain/usecases/delete_todo.dart';
import 'package:todo_app_clean/domain/usecases/delete_todo_impl.dart';
import 'package:todo_app_clean/domain/usecases/get_todos_impl.dart';
import 'package:todo_app_clean/domain/usecases/save_todo.dart';
import 'package:todo_app_clean/domain/usecases/save_todo_impl.dart';

import 'get_todo.dart';
import 'get_todo_impl.dart';
import 'get_todos.dart';

final getTodosProvider = Provider<GetTodosUseCase>(
  (ref) => GetTodosUseCaseImpl(
    ref.read(todosProvider),
  ),
);

final getTodoProvider = Provider<GetTodoUseCase>(
  (ref) => GetTodoUseCaseImpl(
    ref.read(todosProvider),
  ),
);

final saveTodoProvider = Provider<SaveTodoUseCase>(
  (ref) => SaveTodoUseCaseImpl(
    ref.read(todosProvider),
  ),
);

final deleteTodoProvider = Provider<DeleteTodoUseCase>(
  (ref) => DeleteTodoUseCaseImpl(
    ref.read(todosProvider),
  ),
);
