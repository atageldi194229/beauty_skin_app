import 'package:beauty_skin/presentations/common_blocs/application/application_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/favorite/favorite_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/language/language_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonBloc {
  /// Bloc
  static final applicationBloc = ApplicationBloc();
  static final languageBloc = LanguageBloc();
  static final cartBloc = CartBloc();
  static final favoriteBloc = FavoriteBloc();
  // static final orderBloc = OrderBloc();
  // static final profileBloc = ProfileBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<LanguageBloc>(
      create: (context) => languageBloc,
    ),
    BlocProvider<CartBloc>(
      create: (context) => cartBloc,
    ),
    BlocProvider<FavoriteBloc>(
      create: (context) => favoriteBloc,
    ),

    // BlocProvider<ProfileBloc>(
    //   create: (context) => profileBloc,
    // ),
    // BlocProvider<OrderBloc>(
    //   create: (context) => orderBloc,
    // ),
  ];

  /// Dispose
  static void dispose() {
    applicationBloc.close();
    languageBloc.close();
    cartBloc.close();
    favoriteBloc.close();
    // orderBloc.close();
    // profileBloc.close();
  }

  /// Singleton factory
  static final CommonBloc _instance = CommonBloc._internal();
  factory CommonBloc() => _instance;
  CommonBloc._internal();
}
