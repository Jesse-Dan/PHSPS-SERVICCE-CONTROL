import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:phsps_api_work/logic/bloc/home_page_bloc/home_state.dart';
import 'package:phsps_api_work/logic/bloc/index.dart';
import 'package:phsps_api_work/logic/provider/provider.dart';
import 'package:phsps_api_work/presentation/drawer/drawer.dart';
import '../logic/bloc/home_page_bloc/home_bloc.dart';
import '../logic/repository/repository.dart';
import '../presentation/auth/auth_page.dart';
import '../presentation/settings/settings_controller.dart';
import '../presentation/settings/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.appProvider,
  });

  final SettingsController settingsController;

  final Provider appProvider;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(const AuthInitState()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(const HomeInitState()),
        ),
      ],
      child: RepositoryProvider(
        create: (context) => Repository(appProvider),
        child: AnimatedBuilder(
          animation: settingsController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              restorationScopeId: 'app',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
              ],
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: settingsController.themeMode,
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case AuthPage.routeName:
                        return const AuthPage();
                      case SettingsView.routeName:
                        return SettingsView(controller: settingsController);
                      case DrawerWidget.routeName:
                        return  DrawerWidget(controller: settingsController,);
                      default:
                        return const AuthPage();
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
