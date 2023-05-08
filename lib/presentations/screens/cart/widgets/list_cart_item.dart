import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/constants/image_constant.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/widgets/cards/cart_item_card.dart';
import 'package:beauty_skin/presentations/widgets/loadings/loading.dart';
import 'package:beauty_skin/presentations/widgets/others/custom_dismissible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCartItemModel extends StatelessWidget {
  const ListCartItemModel({super.key});

  void _onDismissed(BuildContext context, CartItemModel cartItem) {
    BlocProvider.of<CartBloc>(context).add(RemoveCartItemModel(cartItem));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Loading();
        }
        if (state is CartLoaded) {
          var cart = state.cart;
          return SafeArea(
            child: cart.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cart.length + 1,
                    itemBuilder: (context, index) {
                      if (index == cart.length) {
                        return Container();
                        // return PromoWidget();
                      }
                      return CustomDismissible(
                        key: Key(cart[index].id),
                        onDismissed: (direction) {
                          _onDismissed(context, cart[index]);
                        },
                        removeIcon: const Icon(Icons.remove_shopping_cart),
                        child: CartItemModelCard(cartItem: cart[index]),
                      );
                    },
                  )
                : const Center(
                    child: Text("Emtpty List"),
                  ),
          );
        }
        if (state is CartLoadFailure) {
          return Center(child: Text("Load failure.\n${state.error}"));
        }
        return const Center(child: Text("Something went wrong."));
      },
    );
  }
}
