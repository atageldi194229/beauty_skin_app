import 'dart:math' as math;

import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class ProductCard2 extends StatefulWidget {
  final VoidCallback? onTap;
  final ProductModel product;
  final bool inCart;

  const ProductCard2({
    Key? key,
    required this.product,
    this.onTap,
    this.inCart = false,
  }) : super(key: key);

  @override
  State<ProductCard2> createState() => _ProductCard2State();
}

class _ProductCard2State extends State<ProductCard2> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isAdded = false;
  double _angle = 0;

  final _animatedDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _animatedDuration,
    );

    _animationController.addListener(() {
      setState(() {
        _angle = _animationController.value * 45 / 360 * math.pi * 2;
      });
    });

    if (widget.inCart) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant ProductCard2 oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.inCart == oldWidget.inCart) {
      return;
    }

    if (widget.inCart) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleOnAddCartPressed() {
    setState(() {
      // isAdded = !isAdded;
      // isAdded ? _animationController.forward() : _animationController.reverse();

      debugPrint(_animationController.status.toString());

      final cartBloc = BlocProvider.of<CartBloc>(context);

      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();

        cartBloc.add(RemoveCartItemModelByProduct(widget.product));
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();

        cartBloc.add(AddCartItemModel(CartItemModel(
          id: const Uuid().v4(),
          price: widget.product.discountPrice,
          productId: widget.product.id,
          quantity: 1,
          productInfo: widget.product,
        )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double height = size.width / 3.2;

    const borderRadius = kBorderRadius5;

    return InkWell(
      onTap: () {
        AppRouter().navigatorKey.currentState?.pushNamed(
              AppRouter.DETAIL_PRODUCT,
              arguments: widget.product,
            );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          border: Border.all(
            color: const Color(0xFFE1E1E1),
            width: 1,
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius.copyWith(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                      // color: kSoftGreen,
                    ),
                    width: double.infinity,
                    child: Image.network(
                      widget.product.images.first,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: _buildAddCartButton(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.nameTranslate(context),
                      style: const TextStyle(
                        fontSize: 16.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          "${widget.product.discountPrice}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: COLOR_CONST.primaryColor,
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding),
                        Text(
                          "${widget.product.price}",
                          style: const TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCartButton() {
    Color color = COLOR_CONST.primaryColor;
    Color iconColor = Colors.white;

    if (_animationController.status == AnimationStatus.dismissed) {
      color = Colors.white;
      iconColor = COLOR_CONST.primaryColor;
    }

    return InkWell(
      onTap: _handleOnAddCartPressed,
      child: AnimatedContainer(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: kElevationToShadow[4],
        ),
        duration: _animatedDuration,
        child: Transform.rotate(
          angle: _angle,
          child: Icon(
            Icons.add,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
