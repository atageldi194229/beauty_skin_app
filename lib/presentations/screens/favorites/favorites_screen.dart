import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/common_blocs/favorite/favorite_bloc.dart';
import 'package:beauty_skin/presentations/screens/favorites/widgets/grid_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        buildWhen: (previous, current) => current is FavoritesLoaded,
        builder: (context, state) {
          List<FavoriteItemModel> data = [];

          if (state is FavoritesLoaded) {
            data = state.products;
          }

          return Column(
            children: [
              Expanded(child: GridProducts(products: data)),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(Translate.of(context).translate("cart")),
      actions: [
        IconButton(
          icon: const Icon(Icons.clear_all_rounded),
          onPressed: () => _onClearCart(context),
        )
      ],
    );
  }

  _onClearCart(BuildContext context) async {
    final response = await UtilDialog.showConfirmation(
      context,
      title: Translate.of(context).translate("clear_cart"),
      content: Text(
        Translate.of(context).translate("all_favorites_will_be_deleted"),
        style: FONT_CONST.REGULAR_DEFAULT_20,
      ),
      confirmButtonText: Translate.of(context).translate("delete"),
    ) as bool;

    if (response) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<FavoriteBloc>(context).add(ClearFavorites());
    }
  }
}
