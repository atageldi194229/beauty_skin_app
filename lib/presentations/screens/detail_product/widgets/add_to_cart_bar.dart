import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddToCartBarWidget extends StatefulWidget {
  const AddToCartBarWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<AddToCartBarWidget> createState() => _AddToCartBarWidgetState();
}

class _AddToCartBarWidgetState extends State<AddToCartBarWidget> {
  int count = 0;

  _updateCount(count) {
    if (count < 0) return;

    setState(() {
      this.count = count;
    });

    final cartBloc = context.read<CartBloc>();

    // when we remove from cart
    if (count == 0) {
      cartBloc.add(RemoveCartItemModelByProduct(widget.product));
      return;
    }

    final state = cartBloc.state;
    if (state is! CartLoaded) {
      return;
    }

    var list = state.cart.where((e) => e.productInfo == widget.product);

    if (list.isNotEmpty) {
      // when we updating existing cart item
      cartBloc.add(UpdateCartItemModel(list.first.copyWith(
        quantity: count,
        price: count * widget.product.price,
      )));
    } else {
      // when adding new cart item
      cartBloc.add(AddCartItemModel(CartItemModel(
        id: const Uuid().v4(),
        price: widget.product.price,
        productId: widget.product.id,
        quantity: count,
        productInfo: widget.product,
      )));
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<CartBloc>().state;

      if (state is CartLoaded) {
        if (state.cart.any((e) => e.productInfo == widget.product)) {
          setState(() {
            count = state.cart.firstWhere((e) => e.productInfo == widget.product).quantity;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPrice(context),
          const Spacer(),
          _buildCounter(context),
        ],
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "price".tr(context),
          style: FONT_CONST.BOLD_DEFAULT_18.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: kDefaultPadding * 2),
        Text(
          "${widget.product.price} TMT",
          style: FONT_CONST.REGULAR_PRIMARY.copyWith(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        Text(
          "${widget.product.discountPrice} TMT",
          style: FONT_CONST.REGULAR_PRIMARY_16,
        ),
      ],
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "count".tr(context),
          style: FONT_CONST.BOLD_DEFAULT_18.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: kDefaultPadding * 2),
        Container(
          width: kDefaultPadding * 15,
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          // decoration: BoxDecoration(
          //   border: Border.all(color: COLOR_CONST.primaryColor, width: 1),
          //   borderRadius: kBorderRadius10,
          // ),
          child: Row(
            children: [
              _buildCounterButton(
                Icons.remove_outlined,
                onTap: () => _updateCount(count - 1),
              ),
              Expanded(
                child: Text(
                  "$count",
                  textAlign: TextAlign.center,
                  style: FONT_CONST.BOLD_DEFAULT_18,
                ),
              ),
              _buildCounterButton(
                Icons.add_outlined,
                onTap: () => _updateCount(count + 1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCounterButton(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border.all(color: COLOR_CONST.primaryColor, width: 1),
          borderRadius: kBorderRadius10,
          // color: Colors.grey[100],
        ),
        child: Icon(icon),
      ),
    );
  }
}
