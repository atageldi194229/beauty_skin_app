import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/widgets/cards/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    required this.products,
    this.onBottom,
  });

  final List<ProductModel> products;
  final VoidCallback? onBottom;

  @override
  Widget build(BuildContext context) {
    double cardWidth = 200;
    double cardHeight = cardWidth * 1.3;

    return SizedBox(
      height: cardHeight,
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) => current is CartLoaded,
        builder: (_, cartState) {
          List<CartItemModel>? cart;

          if (cartState is CartLoaded) {
            cart = cartState.cart;
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              bool inCart = false;

              if (cart != null) {
                inCart = cart.any((e) => e.productInfo == products[index]);
              }

              return Container(
                width: cardWidth,
                height: cardHeight,
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: ProductCard2(
                  product: products[index],
                  inCart: inCart,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
