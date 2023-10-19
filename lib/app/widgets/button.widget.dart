import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:model_app/app/theme/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.callback, required this.text, required this.icon});

  final Function callback;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextButton(
      style: tema.styleButton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: const Color.fromARGB(221, 255, 255, 255),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.005,
          ),
          Flexible(
            child: AutoSizeText(
              text,
              style: tema.mainTextWhite,
              minFontSize: 6,
              maxLines: 3,
              overflow: TextOverflow.clip,
              softWrap: true,
            ),
          ),
        ],
      ),
      onPressed: () {
        callback();
      },
    );
  }
}