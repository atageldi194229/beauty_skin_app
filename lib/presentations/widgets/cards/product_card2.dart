import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';

class ProductCard2 extends StatefulWidget {
  final String imageUrl;
  final String description;
  final String price;
  final VoidCallback? onTap;

  const ProductCard2({
    Key? key,
    required this.imageUrl,
    this.description = "",
    this.price = "???",
    this.onTap,
  }) : super(key: key);

  @override
  State<ProductCard2> createState() => _ProductCard2State();
}

class _ProductCard2State extends State<ProductCard2>
    with SingleTickerProviderStateMixin {
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

      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double height = size.width / 3.2;

    const borderRadius = kBorderRadius5;

    return InkWell(
      onTap: widget.onTap,
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
                    child: Image.network(widget.imageUrl, fit: BoxFit.fill),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: _buildAddCartButton(),
                    // child: ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     maximumSize: const Size(28, 28),
                    //     shape: const CircleBorder(),
                    //     // padding: const EdgeInsets.all(10),
                    //     backgroundColor: COLOR_CONST.primaryColor,
                    //     foregroundColor: Colors.white,
                    //   ),
                    //   onPressed: () {},
                    //   child: const Icon(Icons.add_outlined),
                    // ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(kdefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 11.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.price,
                      style: const TextStyle(fontSize: 13.0),
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

    // return InkWell(
    //   onTap: () {},
    //   child: Container(
    //     height: 30,
    //     width: 30,
    //     decoration: const BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: COLOR_CONST.primaryColor,
    //     ),
    //     child: const Icon(
    //       Icons.add_outlined,
    //       color: Colors.white,
    //     ),
    //   ),
    // );
  }
}
