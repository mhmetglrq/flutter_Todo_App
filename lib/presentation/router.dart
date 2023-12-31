import 'package:go_router/go_router.dart';
import 'package:todo_app_clean/presentation/view/todos_edit.dart';
import 'package:todo_app_clean/presentation/view/todos_list.dart';

final router = GoRouter(
  initialLocation: '/todos',
  routes: [
    GoRoute(
      path: '/todos',
      builder: (context, state) => const TodosList(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const TodosEdit(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) => TodosEdit(
            todoId: state.pathParameters['id'],
          ),
        ),
      ],
    ),
  ],
);
