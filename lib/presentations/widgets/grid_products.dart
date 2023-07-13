import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/widgets/cards/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridProducts extends StatelessWidget {
  final List<ProductModel> products;
  final bool isMore;
  final VoidCallback? getMore;

  const GridProducts({
    Key? key,
    required this.products,
    this.isMore = false,
    this.getMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Text("empty".tr(context)),
      );
    }

    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => current is CartLoaded,
      builder: (context, cartState) {
        List<CartItemModel>? cart;

        if (cartState is CartLoaded) {
          cart = cartState.cart;
        }

        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(kDefaultPadding).copyWith(bottom: kDefaultPadding * 2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 15 / 21,
            mainAxisSpacing: kDefaultPadding,
            crossAxisSpacing: kDefaultPadding,
          ),
          itemCount: products.length + (isMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == products.length) {
              getMore?.call();
              return const Center(child: CircularProgressIndicator());
            }

            bool inCart = false;

            if (cart != null) {
              inCart = cart.any((e) => e.productInfo == products[index]);
            }

            return ProductCard2(
              product: products[index],
              inCart: inCart,
            );
          },
        );
      },
    );
  }
}
