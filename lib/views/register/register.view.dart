import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:model_app/app/widgets/button.widget.dart';
import 'package:model_app/app/widgets/message.widget.dart';
import 'package:model_app/controllers/user.controller.dart';
import 'package:model_app/main.dart';
import 'package:model_app/views/register/widgets/input_area.widget.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    return LayoutBuilder(
      builder: (context, boxConstraint) {
        return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                userController.clearControllers();
                context.pop();
              },
            ),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.black12,
            title: const Text(
                'Cadastro',
                selectionColor: Colors.black,
              ),
            centerTitle: true,
          ),
          body: Form(
                  key: keys.registerKey,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: boxConstraint.maxHeight > 600
                                ? MediaQuery.of(context).size.height * 0.36
                                : 220,
                            child: Center(
                              child: Icon(
                                Icons.question_mark_rounded,
                                color: Colors.blue, 
                                size: boxConstraint.maxHeight > 600
                                ? MediaQuery.of(context).size.height * 0.20
                                : 120),
                            ),
                          ),
                          const InputAreaRegister(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                            child: SizedBox(
                            height: 42,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Center(
                              child: ButtonWidget(
                                text: 'Cadastrar',
                                icon: Icons.check,
                                callback: () {
                                  if (keys.registerKey.currentState!.validate()) {
                                    if (userController
                                            .confirmPasswordController.text ==
                                        userController.passwordController.text) {
                                      userController.clearControllers();
                                    } else {
                                      message(
                                          context, "As senhas devem ser iguais.");
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
    );
      },
    );
  }
}
