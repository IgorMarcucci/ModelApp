import 'package:flutter/material.dart';
import 'package:model_app/app/widgets/input_email.widget.dart';
import 'package:model_app/app/widgets/input_password.widget.dart';
import 'package:model_app/app/widgets/input_username.dart';
import 'package:model_app/controllers/user.controller.dart';
import 'package:provider/provider.dart';

class InputAreaRegister extends StatelessWidget {
  const InputAreaRegister({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputUsername(
            text: 'Insira o username',
            inputType: TextInputType.name,
            icone: const Icon(
              Icons.person,
            ),
            usernameController: userController.usernameController,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputEmail(
            text: 'Insira o email',
            inputType: TextInputType.emailAddress,
            icone: const Icon(Icons.mail),
            emailController: userController.emailController,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputPassword(
            passwordController: userController.passwordController,
            text: 'Insira a senha',
            icone: const Icon(
              Icons.lock,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: InputPassword(
            passwordController: userController.confirmPasswordController,
            text: 'Confirme a senha',
            icone: const Icon(
              Icons.lock,
            ),
          ),
        ),
      ],
    );
  }
}
