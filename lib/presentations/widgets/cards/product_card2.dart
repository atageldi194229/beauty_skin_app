import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductCard2 extends StatelessWidget {
  final String imageUrl;
  final String description;
  final double price;
  final VoidCallback? onTap;

  const ProductCard2({
    Key? key,
    this.imageUrl =
        "https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=600",
    this.description =
        "Баннер c чёрной подложкой 2,00x50 глянецБаннер c чёрной подложкой 2,00x50 глянец",
    this.price = 1500,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.width / 3.2;

    const borderRadius = kBorderRadius5;

    return InkWell(
      onTap: onTap,
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
                    child: Image.network(imageUrl, fit: BoxFit.fill),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: IconButton(
                      color: COLOR_CONST.primaryColor,
                      // splashColor: COLOR_CONST.primaryColor,
                      highlightColor: COLOR_CONST.primaryColor,
                      onPressed: () {},
                      icon: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: COLOR_CONST.primaryColor,),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(IconlyLight.plus,
                                color: Colors.white),
                          ),),
                    ),
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
                      description,
                      style: const TextStyle(
                        fontSize: 11.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
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
}
