import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:model_app/app/theme/theme.dart';

void message(BuildContext context, String msg) {
  final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SizedBox(
        // color: ,
        height: 50,
        child: Center(
          child: AutoSizeText(
            msg,
            style: tema.mainTextWhite,
            minFontSize: 6,
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
