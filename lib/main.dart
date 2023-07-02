import 'package:flutter/material.dart';
import 'package:phsps_api_work/logic/db/local_db.dart';
import 'package:phsps_api_work/logic/provider/provider.dart';

import 'src/app.dart';
import 'presentation/settings/settings_controller.dart';
import 'presentation/settings/settings_service.dart';

void main() async {
  /// init local db
  LocalStorageService.getInstance();
  // init all app functions
  final settingsController = SettingsController(SettingsService());
  final authProvider = Provider();

  // init settiongs
  await settingsController.loadSettings();
  runApp(MyApp(
    settingsController: settingsController,
    appProvider: authProvider,
  ));
}
