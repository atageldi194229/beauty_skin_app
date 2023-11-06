import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/localization/tm_material_localization.dart' as tm;
import 'package:beauty_skin/presentations/common_blocs/application/application_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/common_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/favorite/favorite_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/language/language_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/order/order_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/profile/profile_bloc.dart';
import 'package:beauty_skin/presentations/widgets/others/my_bottom_nav_bar.dart';
import 'package:beauty_skin/localization/translate.dart';
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
    AppRouter()
        .navigatorKey
        .currentState
        ?.pushNamedAndRemoveUntil(route, (route) => false);
  }

  void navigateToMainScreen() {
    AppRouter().navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const MyBottomNavBar(),
          ),
        );
  }

  void loadData() {
    // Only load data when authenticated
    BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
    BlocProvider.of<CartBloc>(context).add(LoadCart());
    BlocProvider.of<FavoriteBloc>(context).add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplicationBloc, ApplicationState>(
      listener: (context, state) {
        if (state is ApplicationCompleted) {
          loadData();
          // onNavigate(AppRouter.HOME);
          onNavigate(AppRouter.SPLASH);
          // navigateToMainScreen();
        } else {
          // navigateToMainScreen();
          // onNavigate(AppRouter.MAIN);
          onNavigate(AppRouter.SPLASH);
        }
      },
      builder: (context, applicationState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return ScaffoldMessenger(
              child: MaterialApp(
                navigatorKey: AppRouter().navigatorKey,
                debugShowCheckedModeBanner: Application.debug,
                title: Application.title,
                theme: AppTheme.currentTheme,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: AppRouter.SPLASH,
                locale: AppLanguage.defaultLanguage,
                supportedLocales: AppLanguage.supportLanguage,
                localizationsDelegates: const [
                  Translate.delegate,
                  tm.TmMaterialLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                builder: (context, child) {
                  return MultiBlocListener(
                    listeners: [
                      BlocListener<OrderBloc, OrderState>(
                        listener: (context, state) {
                          if (state.status ==
                              OrderStatus.loadingOrderSentSucceeded) {
                            context.read<OrderBloc>().add(LoadMyOrders());
                            context.read<CartBloc>().add(ClearCart());
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.only(
                                  bottom: kDefaultPadding,
                                ),
                                backgroundColor: Colors.green,
                                content: Text("success".tr(context)),
                              ));
                          }

                          if (state.status ==
                              OrderStatus.loadingOrderSentFailure) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.only(
                                    bottom: kDefaultPadding,
                                  ),
                                  backgroundColor: Colors.red,
                                  content: Text("failure".tr(context)),
                                ),
                              );
                          }
                        },
                      ),
                      BlocListener<CartBloc, CartState>(
                        listener: (context, state) {
                          if (state is CartItemAdded) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.only(
                                    bottom: kDefaultPadding,
                                  ),
                                  content: Text("cart_item_added".tr(context)),
                                ),
                              );
                          }
                          if (state is CartItemRemoved) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.only(
                                    bottom: kDefaultPadding,
                                  ),
                                  content:
                                      Text("cart_item_removed".tr(context)),
                                ),
                              );
                          }
                        },
                      ),
                    ],
                    child: child ?? const SizedBox(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
