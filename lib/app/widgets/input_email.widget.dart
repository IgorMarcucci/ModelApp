import 'package:flutter/material.dart';
import 'package:model_app/app/theme/theme.dart';
import 'package:model_app/app/validators/validate_email.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({
    Key? key,
    required this.text,
    required this.inputType,
    required this.icone,
    required this.emailController,
  }) : super(key: key);

  final Icon icone;
  final String text;
  final TextInputType inputType;
  final TextEditingController? emailController;

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        icon: widget.icone,
        labelText: widget.text,
        // labelStyle: tema.styletextfield,
      ),
      style: tema.mainTextBlack,
      controller: widget.emailController,
      validator: (value) => validateEmail(value!),
    );
  }
}
