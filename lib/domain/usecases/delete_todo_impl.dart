import 'package:todo_app_clean/domain/repository/todos.dart';
import 'package:todo_app_clean/domain/usecases/delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  final TodosRepository todosRepository;

  DeleteTodoUseCaseImpl(this.todosRepository);

  @override
  Future<void> execute(String id) async => todosRepository.deleteTodo(id);
}
