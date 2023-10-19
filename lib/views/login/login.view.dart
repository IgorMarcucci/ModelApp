import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:model_app/app/theme/theme.dart';
import 'package:model_app/app/widgets/button.widget.dart';
import 'package:model_app/controllers/user.controller.dart';
import 'package:model_app/main.dart';
import 'package:model_app/views/login/widgets/input_area.widget.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return LayoutBuilder(
      builder: (context, boxConstraint) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Form(
                    key: keys.loginKey,
                    child: SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          height: boxConstraint.maxHeight > 600
                              ? MediaQuery.of(context).size.height
                              : 600,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: boxConstraint.maxHeight > 600
                                    ? MediaQuery.of(context).size.height * 0.36
                                    : 216,
                                child: Center(
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: Colors.blue, 
                                    size: boxConstraint.maxHeight > 600
                                    ? MediaQuery.of(context).size.height * 0.20
                                    : 120),
                                ),
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
                                    Flexible(
                                      child: AutoSizeText(
                                        'Login',
                                        style: tema.mainTextBlack,
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                    const InputAreaLogin(),
                                    Flexible(
                                      child: SizedBox(
                                        height: 42,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: ButtonWidget(
                                          callback: () {
                                            if (keys.loginKey.currentState!
                                                .validate()) {
                                              context.go('/main');
                                              userController.clearControllers();
                                            }
                                          },
                                          icon: Icons.login,
                                          text: "Login",
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
