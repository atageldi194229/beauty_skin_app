import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model2.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/widgets/cards/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridProducts extends StatelessWidget {
  final List<ProductModel2> products;

  const GridProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text("Empty"),
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
          padding: const EdgeInsets.all(kdefaultPadding),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 15 / 21,
            mainAxisSpacing: kdefaultPadding,
            crossAxisSpacing: kdefaultPadding,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            bool inCart = false;

            if (cart != null) {
              inCart = cart.any((e) => e.productInfo == products[index]);
            }

            return ProductCard2(
              product: products[index],
              imageUrl: products[index].imageUrl,
              description: products[index].productName!,
              price: products[index].price!,
              inCart: inCart,
            );
          },
        );
      },
    );
  }
}
