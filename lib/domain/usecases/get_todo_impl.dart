import 'package:todo_app_clean/domain/model/todo.dart';
import 'package:todo_app_clean/domain/repository/todos.dart';
import 'package:todo_app_clean/domain/usecases/get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  final TodosRepository todosRepository;

  GetTodoUseCaseImpl(this.todosRepository);

  @override
  Future<Todo?> execute(String id) => todosRepository.getTodoById(id);
}
