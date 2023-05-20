import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/common_blocs/favorite/favorite_bloc.dart';
import 'package:beauty_skin/presentations/widgets/grid_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beauty_skin/utils/utils.dart';

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
          if (state is FavoritesLoaded) {
            return Column(
              children: [
                Expanded(child: GridProducts(products: state.products)),
              ],
            );
          }

          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoritesLoadFailure) {
            return Center(child: Text(state.error));
          }

          return const Center(child: Text("Something went wrong."));
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("favorites".tr(context)),
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
      title: "clear_cart".tr(context),
      content: Text(
        "all_favorites_will_be_deleted".tr(context),
        style: FONT_CONST.REGULAR_DEFAULT_20,
      ),
      confirmButtonText: "delete".tr(context),
    ) as bool;

    if (response) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<FavoriteBloc>(context).add(ClearFavorites());
    }
  }
}
