import 'package:go_router/go_router.dart';
import 'package:model_app/views/change-pass/change-pass.view.dart';
import 'package:model_app/views/login/login.view.dart';
import 'package:model_app/views/register/register.view.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return const RegisterView();
      },
    ),
    GoRoute(
      path: '/change-pass',
      builder: (context, state) {
        return const ChangePassView();
      },
    ),
  ],
);
