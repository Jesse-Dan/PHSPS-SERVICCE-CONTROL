// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:alert_system/alert_overlay_plugin.dart';
import 'package:flutter/material.dart';
import 'package:phsps_api_work/presentation/widgets/alert_dialogue.dart';

class OverlayService {
  static void Function()? cancelFunc;
  static void showAlert({
    required String title,
    String? content,
    VoidCallback? onDone,
    VoidCallback? onCancel,
    Widget? child,
    bool autoImplyActions = true,
    List<Widget>? actions,
    String? onDoneText,
    String? onCancelText,
  }) {
    OverlayManager.show(
      cancelFunc: cancelFunc,
      child: ReusableAlertDialog(
        title: title,
        content: content,
        onDone: onDone,
        onCancel: onCancel,
        autoImplyActions: autoImplyActions,
        actions: actions,
        onDoneText: onDoneText,
        onCancelText: onCancelText,
        child: child,
      ),
    );
  }

  OverlayService.showLoading({required Widget child}) {
    OverlayManager.show(
        child: const CircularProgressIndicator(), cancelFunc: cancelFunc);
  }

  OverlayService.closeAlert() {
    OverlayManager.dismissOverlay();
  }
}
