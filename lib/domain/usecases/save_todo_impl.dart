import 'package:todo_app_clean/domain/model/todo.dart';
import 'package:todo_app_clean/domain/repository/todos.dart';
import 'package:todo_app_clean/domain/usecases/save_todo.dart';

class SaveTodoUseCaseImpl extends SaveTodoUseCase {
  final TodosRepository todosRepository;

  SaveTodoUseCaseImpl(this.todosRepository);

  @override
  Future<void> execute(Todo todo) async => await todosRepository.saveTodo(todo);
}
