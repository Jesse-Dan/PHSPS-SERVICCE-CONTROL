import 'package:flutter/material.dart';

class ReusableAlertDialog extends StatelessWidget {
  final String title;
  final String? content;

  /// on done is active if  autoImplyActions is
  final Function()? onDone;
  final String? onDoneText;

  final Function()? onCancel;
  final String? onCancelText;

  final Widget? child;
  final bool autoImplyActions;
  final List<Widget>? actions;

  ReusableAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onDone,
    required this.onCancel,
    required this.child,
    required this.autoImplyActions,
    required this.actions,
    required this.onDoneText,
    required this.onCancelText,
  }) {
    if (autoImplyActions && actions != null) {
      throw Exception(
          'can\'t use autoImplyActions and actions together, if autoImplyActions is true actions must be null');
    } else if (child != null && content!.isNotEmpty) {
      throw Exception(
          'can\'t use child and content together, if child is not null content must be [content = '
          ']');
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        content: child ?? Text(content ?? ''),
        actions: autoImplyActions
            ? <Widget>[
                TextButton(
                  onPressed: onCancel ?? () {},
                  child: Text(onCancelText ?? 'Cancel'),
                ),
                ElevatedButton(
                  onPressed: onDone ?? () {},
                  child: Text(onDoneText ?? 'Done'),
                ),
              ]
            : actions);
  }
}
