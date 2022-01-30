import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogAlertButton extends StatelessWidget {
  const DialogAlertButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
    this.textStyle,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final bool isDestructiveAction;
  final bool isDefaultAction;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS
        ? TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: textStyle,
            ),
          )
        : CupertinoDialogAction(
            isDestructiveAction: isDestructiveAction,
            isDefaultAction: isDefaultAction,
            onPressed: onPressed,
            child: Text(
              title,
              style: textStyle,
            ),
          );
  }
}
