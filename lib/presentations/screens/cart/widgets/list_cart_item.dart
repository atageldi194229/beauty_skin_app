import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/widgets/cards/cart_item_card.dart';
import 'package:beauty_skin/presentations/widgets/others/custom_dismissible.dart';
import 'package:beauty_skin/presentations/widgets/others/loading.dart';
import 'package:beauty_skin/localization/translate.dart';
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
      builder: (context, cartState) {
        if (cartState is CartLoading) {
          return const Loading();
        }
        if (cartState is CartLoaded) {
          var cart = cartState.cart;
          return SafeArea(
            child: cart.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(kdefaultPadding).copyWith(
                      bottom: kdefaultPadding * 2,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: cart.length + 1,
                    itemBuilder: (context, index) {
                      if (index == cart.length) {
                        return _buildCheckout(context, cartState);
                      }
                      return Padding(
                        padding: const EdgeInsets.only(bottom: kdefaultPadding),
                        child: CustomDismissible(
                          key: Key(cart[index].id),
                          onDismissed: (direction) {
                            _onDismissed(context, cart[index]);
                          },
                          removeIcon: const Icon(Icons.remove_shopping_cart),
                          child: CartItemModelCard(cartItem: cart[index]),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text("Emtpty List"),
                  ),
          );
        }
        if (cartState is CartLoadFailure) {
          return Center(child: Text("Load failure.\n${cartState.error}"));
        }
        return const Center(child: Text("Something went wrong."));
      },
    );
  }

  Widget _buildCheckout(context, CartLoaded cartState) {
    return InkWell(
      onTap: () {},
      borderRadius: kBorderRadius10,
      child: Ink(
        padding: const EdgeInsets.all(kdefaultPadding * 2),
        decoration: const BoxDecoration(
          color: COLOR_CONST.primaryColor,
          borderRadius: kBorderRadius10,
        ),
        child: Row(
          children: [
            Text("check_out".tr(context)),
            const Icon(Icons.navigate_next_outlined),
            const Spacer(),
            Text("${cartState.priceOfGoods} TMT"),
          ],
        ),
      ),
    );
  }
}
