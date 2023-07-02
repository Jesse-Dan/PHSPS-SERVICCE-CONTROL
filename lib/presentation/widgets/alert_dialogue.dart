import 'package:flutter/material.dart';

class ReusableAlertDialog extends StatelessWidget {
  final String title;
  final String? content;
  /// on done is active if  autoImplyActions is 
  final Function()? onDone;
  final Widget? child;
  final bool autoImplyActions;
  final List<Widget>? actions;

  const ReusableAlertDialog({
    super.key,
    required this.title,
    this.content,
    this.onDone,
    this.child, required this.autoImplyActions, this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        content: child ?? Text(content!),
        actions: autoImplyActions? <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            onPressed: onDone ?? () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ]:actions
        
        );
  }
}
