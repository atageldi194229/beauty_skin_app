import 'package:beauty_skin/data/models/product_model2.dart';
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

  final List<ProductModel2> products;
  final VoidCallback? onBottom;

  @override
  Widget build(BuildContext context) {
    double cardWidth = 150;
    double cardHeight = cardWidth * 1.3;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding * 2),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            width: cardWidth,
            height: cardHeight,
            padding: const EdgeInsets.only(right: kdefaultPadding),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return ProductCard2(
                  product: products[index],
                  imageUrl: products[index].imageUrl,
                  description: products[index].productName!,
                  price: products[index].price!,
                  inCart: state is CartLoaded &&
                      state.cart.any((e) => e.productInfo == products[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
