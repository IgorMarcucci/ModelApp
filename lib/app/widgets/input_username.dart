import 'package:flutter/material.dart';
import 'package:model_app/app/validators/validate_username.dart';

class InputUsername extends StatelessWidget {
  const InputUsername({
    Key? key,
    required this.text,
    required this.inputType,
    required this.icone, required this.usernameController,
  }) : super(key: key);

  final Icon icone;
  final String text;
  final TextInputType inputType;
  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: inputType,
      decoration: InputDecoration(
        icon: icone,
        labelText: text,
      ),
      controller: usernameController,
      validator: (value) => validateUsername(value!),
    );
  }
}
