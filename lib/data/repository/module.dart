import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean/data/repository/todos_impl.dart';
import 'package:todo_app_clean/data/source/module.dart';
import 'package:todo_app_clean/domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) => TodosRepositoryImpl(ref.read(filesProvider)));
