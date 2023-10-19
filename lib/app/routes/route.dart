import 'package:go_router/go_router.dart';
import 'package:model_app/views/login/login.view.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginView();
      },
    ),
  ],
);
