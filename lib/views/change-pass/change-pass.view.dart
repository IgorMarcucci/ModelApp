import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:model_app/app/theme/theme.dart';
import 'package:model_app/app/widgets/button.widget.dart';
import 'package:model_app/app/widgets/input_email.widget.dart';
import 'package:model_app/controllers/user.controller.dart';
import 'package:model_app/main.dart';
import 'package:provider/provider.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    UserController userController = context.read<UserController>();
    return LayoutBuilder(
      builder: (context, boxConstraint) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  userController.clearControllers();
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              // backgroundColor: Color.fromARGB(255, 218, 218, 218),
              surfaceTintColor: Colors.black12,
              centerTitle: true,
              title: const Text(
                'Alterar senha',
                selectionColor: Colors.black,
              ),
            ),
            body: Form(
              key: keys.changePassKey,
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    height: boxConstraint.maxHeight > 600
                        ? MediaQuery.of(context).size.height - 56
                        : 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: boxConstraint.maxHeight > 600
                              ? MediaQuery.of(context).size.height *
                                      0.36 -
                                  56
                              : 216,
                          child: Icon(
                                    Icons.question_mark_rounded,
                                    color: Colors.blue, 
                                    size: boxConstraint.maxHeight > 600
                                    ? MediaQuery.of(context).size.height * 0.20
                                    : 120),
                        ),
                        SizedBox(
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width,
                          height: boxConstraint.maxHeight > 600
                              ? MediaQuery.of(context).size.height * 0.64
                              : 384,
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    30, 0, 30, 0),
                                child: AutoSizeText(
                                  'Insira seu endereço de email cadastrado no aplicativo, iremos enviar um email de alteração de senha!',
                                  style: tema.mainTextBlack,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.7,
                                child: InputEmail(
                                  text: 'Insira o email',
                                  inputType: TextInputType.emailAddress,
                                  icone: const Icon(Icons.mail),
                                  emailController:
                                      userController.emailController,
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 42,
                                  width:
                                      MediaQuery.of(context).size.width *
                                          0.6,
                                  child: ButtonWidget(
                                    text: 'Alterar senha',
                                    callback: () {
                                      if (keys.changePassKey.currentState!
                                          .validate()) {
                                        userController.clearControllers();
                                        context.go('/');
                                      }
                                    },
                                    icon: Icons.send,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
