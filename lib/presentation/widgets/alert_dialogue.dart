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
    Key? key,
    required this.title,
    this.content,
    this.onDone,
    this.onCancel,
    this.child,
    this.autoImplyActions = false,
    this.actions,
    this.onDoneText,
    this.onCancelText,
  }) {
    if (autoImplyActions && actions != null) {
      throw Exception(
          'Cannot use autoImplyActions and actions together. If autoImplyActions is true, actions must be null.');
    } else if (child != null && content != null && content!.isNotEmpty) {
      throw Exception(
          'Cannot use child and content together. If child is not null, content must be null or empty.');
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
          : actions,
    );
  }
}
