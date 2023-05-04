import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';

class ProductCard2 extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String price;
  final VoidCallback? onTap;

  const ProductCard2({
    Key? key,
    this.imageUrl =
        "https://sharafyabi.com/uploads/115/16022022-071957_383-big.webp",
    this.description =
        "Баннер c чёрной подложкой 2,00x50 глянецБаннер c чёрной подложкой 2,00x50 глянец",
    this.price = "1500",
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
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: COLOR_CONST.primaryColor,
                        ),
                        child: const Icon(
                          Icons.add_outlined,
                          color: Colors.white,
                        ),
                      ),
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
                      price,
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
