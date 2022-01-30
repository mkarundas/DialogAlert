import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dialog_alert_button.dart';

enum ButtonActionType { action, cancel }

Future<ButtonActionType?> showDialogAlert({
  required BuildContext context,
  required String title,
  required String message,
  required String actionButtonTitle,
  String? cancelButtonTitle,
  TextStyle? actionButtonTextStyle,
  TextStyle? cancelButtonTextStyle,
}) {
  return _showDialogAlert(
    context: context,
    title: title,
    message: message,
    actionButtonTitle: actionButtonTitle,
    cancelButtonTitle: cancelButtonTitle,
    actionButtonTextStyle: actionButtonTextStyle,
    cancelButtonTextStyle: cancelButtonTextStyle,
  );
}

Future<ButtonActionType?> _showDialogAlert({
  required BuildContext context,
  required String title,
  required String message,
  required String actionButtonTitle,
  String? cancelButtonTitle,
  TextStyle? actionButtonTextStyle,
  TextStyle? cancelButtonTextStyle,
}) {
  final actions = [
    DialogAlertButton(
        onPressed: () => Navigator.of(context).pop(ButtonActionType.action),
        isDefaultAction: true,
        title: actionButtonTitle,
        textStyle: actionButtonTextStyle),
  ];

  if (cancelButtonTitle != null) {
    actions.insert(
        0,
        DialogAlertButton(
          onPressed: () => Navigator.of(context).pop(ButtonActionType.cancel),
          title: cancelButtonTitle,
          textStyle: cancelButtonTextStyle,
        ));
  }

  return _showDialogAlertWidget(context, title, message, actions);
}

Future<ButtonActionType?> _showDialogAlertWidget(
    BuildContext context, String title, String message, List<Widget> actions) {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(title), content: Text(message), actions: actions));
  }
  return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: actions,
          ));
}
