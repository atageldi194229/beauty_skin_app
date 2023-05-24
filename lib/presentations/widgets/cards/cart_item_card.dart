import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/data/models/product/product_model_extension.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/widgets/others/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemModelCard extends StatelessWidget {
  const CartItemModelCard({
    Key? key,
    required this.cartItem,
    this.allowChangeQuantity = true,
  }) : super(key: key);

  final CartItemModel cartItem;
  final bool allowChangeQuantity;

  @override
  Widget build(BuildContext context) {
    var product = cartItem.productInfo;

    if (product == null) {
      return Text(cartItem.id);
    }

    return CustomCardWidget(
      onTap: () {
        AppRouter()
            .navigatorKey
            .currentState
            ?.pushNamed(AppRouter.DETAIL_PRODUCT, arguments: product);
      },
      padding: EdgeInsets.only(right: SizeConfig.defaultSize),
      child: Row(
        children: [
          _buildCartItemModelImage(product),
          SizedBox(width: SizeConfig.defaultSize),
          Expanded(child: _buildCartItemModelInfo(product, context)),
        ],
      ),
    );
  }

  _buildCartItemModelImage(ProductModel product) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize * 0.5),
      child: SizedBox(
        width: SizeConfig.defaultSize * 13,
        height: SizeConfig.defaultSize * 13,
        child: Image.network(product.images.first, fit: BoxFit.fill),
      ),
    );
  }

  _buildCartItemModelInfo(ProductModel product, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Product Name
        Text(
          product.nameTranslate(context),
          // style: FONT_CONST.MEDIUM_DEFAULT_16,
          maxLines: 1,
        ),

        // Cart item price
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "${product.price}",
            // style: FONT_CONST.REGULAR_PRIMARY_18,
          ),
        ),

        allowChangeQuantity
            ? _buildCartItemModelQuantity(product, context)
            : Text("x ${cartItem.quantity}")
      ],
    );
  }

  _buildCartItemModelQuantity(ProductModel product, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decrease button
        IconButton(
          icon: const Icon(Icons.remove),
          iconSize: SizeConfig.defaultSize * 1.2,
          onPressed: cartItem.quantity > 1
              ? () => _onChangeQuantity(context, product, cartItem.quantity - 1)
              : () {},
        ),

        // Quantity
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
          child: Text(
            "${cartItem.quantity}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Increase button
        IconButton(
          icon: const Icon(Icons.add),
          iconSize: SizeConfig.defaultSize * 1.2,
          onPressed: cartItem.quantity < 10
              ? () => _onChangeQuantity(context, product, cartItem.quantity + 1)
              : () {},
        )
      ],
    );
  }

  _onChangeQuantity(
    BuildContext context,
    ProductModel product,
    int newQuantity,
  ) {
    // update cart item
    BlocProvider.of<CartBloc>(context).add(UpdateCartItemModel(
      cartItem.copyWith(
        quantity: newQuantity,
        price: newQuantity * product.price,
      ),
    ));
  }
}
