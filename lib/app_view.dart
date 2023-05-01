import 'package:beauty_skin/presentations/common_blocs/application/application_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/common_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/language/language_bloc.dart';
import 'package:beauty_skin/presentations/widgets/others/my_bottom_nav_bar.dart';
import 'package:beauty_skin/utils/translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'configs/config.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    CommonBloc.applicationBloc.add(SetupApplication());
    super.initState();
  }

  @override
  void dispose() {
    CommonBloc.dispose();
    super.dispose();
  }

  void onNavigate(String route) {
    _navigator?.pushNamedAndRemoveUntil(route, (route) => false);
  }

  void navigateToMainScreen() {
    _navigator?.pushReplacement(MaterialPageRoute(
      builder: (_) => const MyBottomNavBar(),
    ));
  }

  void loadData() {
    // Only load data when authenticated
    // BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
    // BlocProvider.of<CartBloc>(context).add(LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplicationBloc, ApplicationState>(
      listener: (context, state) {
        if (state is ApplicationCompleted) {
          loadData();
          // onNavigate(AppRouter.HOME);
          // onNavigate(AppRouter.SPLASH);
          navigateToMainScreen();
        } else {
          onNavigate(AppRouter.SPLASH);
        }
      },
      builder: (context, applicationState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: Application.debug,
              title: Application.title,
              theme: AppTheme.currentTheme,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: AppRouter.SPLASH,
              locale: AppLanguage.defaultLanguage,
              supportedLocales: AppLanguage.supportLanguage,
              localizationsDelegates: const [
                Translate.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) {
                return child!;
              },
            );
          },
        );
      },
    );
  }
}
